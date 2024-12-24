package com.cxrus.cyb.exception;

public class OrderNotFoundException extends RuntimeException {
  private static final long serialVersionUID = 4276827183204991657L;
  public OrderNotFoundException(String message) {
    super(message);
  }
}
