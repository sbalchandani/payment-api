package com.example.paymentapi.controller;

import com.example.paymentapi.entity.Payment;
import com.example.paymentapi.repository.PaymentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/payments")
public class PaymentController {
    @Autowired
    private PaymentRepository paymentRepository;

    @PostMapping
    public ResponseEntity<Payment> submitPayment(@RequestBody Payment payment) {
        Payment savedPayment = paymentRepository.save(payment);
        return ResponseEntity.ok(savedPayment);
    }
}
