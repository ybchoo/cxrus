package com.cxrus.cyb.exception;

public class OrderIdExistException extends RuntimeException{
  private static final long serialVersionUID = -7785997268261032127L;
  public OrderIdExistException(String message) {
    super(message);
  }
}
