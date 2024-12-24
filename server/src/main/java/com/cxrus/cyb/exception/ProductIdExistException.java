package com.cxrus.cyb.exception;

public class ProductIdExistException  extends RuntimeException{
  private static final long serialVersionUID = 295631367334332340L;
  public ProductIdExistException(String message) {
    super(message);
  }
}
