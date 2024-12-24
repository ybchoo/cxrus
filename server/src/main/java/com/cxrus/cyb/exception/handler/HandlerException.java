package com.cxrus.cyb.exception.handler;

import com.cxrus.cyb.exception.*;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

@ControllerAdvice
public class HandlerException extends ResponseEntityExceptionHandler {

  @ExceptionHandler(value = {ProductNotFoundException.class})
  public ResponseEntity<?> handleProductNotFound(ProductIdExistException _productExistException) {
    return handleExceptionInternal(_productExistException,
        _productExistException.getMessage(),
        new HttpHeaders(), HttpStatus.NOT_ACCEPTABLE, null);
  }

  @ExceptionHandler(value = {OrderNotFoundException.class})
  public ResponseEntity<?> handleOrderNotFound(OrderIdExistException _orderExistException) {
    return handleExceptionInternal(_orderExistException,
        _orderExistException.getMessage(),
        new HttpHeaders(), HttpStatus.NOT_ACCEPTABLE, null);
  }

  @ExceptionHandler(value = {CustomerNotFoundException.class})
  public ResponseEntity<?> handleCustomerNotFound(CustomerIdExistException _customerExistException) {
    return handleExceptionInternal(_customerExistException,
        _customerExistException.getMessage(),
        new HttpHeaders(), HttpStatus.NOT_ACCEPTABLE, null);
  }

}
