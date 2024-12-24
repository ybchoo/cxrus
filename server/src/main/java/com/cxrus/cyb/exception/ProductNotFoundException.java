package com.cxrus.cyb.exception;

public class ProductNotFoundException extends RuntimeException {
  private static final long serialVersionUID = -8336894449913528892L;
  public ProductNotFoundException(String message) {
    super(message);
  }
}