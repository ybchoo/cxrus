package com.cxrus.cyb.exception;

public class CustomerIdExistException extends RuntimeException {
  private static final long serialVersionUID = 3664641185936711613L;
  public CustomerIdExistException(String message) {
    super(message);
  }
}
