package com.cxrus.cyb.exception;

public class CustomerNotFoundException extends RuntimeException {
  private static final long serialVersionUID = 3664641185936711613L;
  public CustomerNotFoundException(String message) {
    super(message);
  }
}
