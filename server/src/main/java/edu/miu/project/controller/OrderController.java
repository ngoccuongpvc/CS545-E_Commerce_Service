package edu.miu.project.controller;

import edu.miu.project.entity.Order;
import edu.miu.project.entity.OrderStatus;
import edu.miu.project.entity.dto.OrderRequest;
import edu.miu.project.service.OrderService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.Parameters;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import edu.miu.project.util.Constants;

@RestController
@RequestMapping("/api/v1/orders")
@CrossOrigin(origins = "*", allowedHeaders = "*")
public class OrderController {

    @Autowired
    OrderService orderService;

    @Operation(
            summary = "Cancel an order",
            description = "Cancels the specified order by order ID.",
            responses = {
                    @ApiResponse(responseCode = "200", description = "Order canceled successfully",
                            content = @Content(mediaType = "application/json", schema = @Schema(implementation = Order.class))),
                    @ApiResponse(responseCode = "400", description = "Bad request",
                            content = @Content(mediaType = "application/json"))
            }
    )
    @Parameters({
            @Parameter(name = "orderId", description = "ID of the order to cancel", required = true)
    })
    @PreAuthorize("hasRole('SELLER')" + "|| hasRole('BUYER')")
    @PutMapping("/{orderId}/cancel")
    public ResponseEntity<?> cancelOrder(@PathVariable Long orderId) {
        try {
            boolean canceledOrder = orderService.cancelOrder(orderId);
            return ResponseEntity.ok(canceledOrder);
        } catch (RuntimeException e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @Operation(
            summary = "Update order status",
            description = "Updates the status of the specified order by order ID.",
            responses = {
                    @ApiResponse(responseCode = "200", description = "Order status updated successfully",
                            content = @Content(mediaType = "application/json", schema = @Schema(implementation = Order.class))),
                    @ApiResponse(responseCode = "400", description = "Bad request",
                            content = @Content(mediaType = "application/json"))
            }
    )
    @Parameters({
            @Parameter(name = "orderId", description = "ID of the order to update", required = true),
            @Parameter(name = "status", description = "New status of the order", required = true)
    })
    @PreAuthorize("hasRole('SELLER')")
    @PutMapping("/{orderId}/status")
    public ResponseEntity<?> updateOrderStatus(@PathVariable Long orderId, @RequestBody String status) {
        try {
            OrderStatus newStatus = OrderStatus.valueOf(status.toUpperCase());
            Order updatedOrder = orderService.updateOrderStatus(orderId, newStatus);
            return ResponseEntity.ok(updatedOrder);
        } catch (RuntimeException e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @PreAuthorize("hasRole('BUYER')")
    @PostMapping("/order")
    public ResponseEntity<?> placeOrder(@RequestBody OrderRequest order) {
        try {
            orderService.placeOrder(order);
            return ResponseEntity.ok("Order placed successfully.");
        } catch (RuntimeException e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @PreAuthorize("hasRole('BUYER')")
    @GetMapping("/history")
    public ResponseEntity<?> getOrderHistory(@RequestParam(name = "page", defaultValue = "0") int page,
                                             @RequestParam(name = "pagesize", defaultValue = Constants.PAGE_SIZE) int pageSize) {
        try {
            Pageable pageable = PageRequest.of(page, pageSize);
            return ResponseEntity.ok(orderService.getOrderHistory(pageable));
        } catch (RuntimeException e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }
}