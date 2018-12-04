package com.chixing.exception;
/**
 * 重复提交异常
 */
public class DuplicateSubmitException extends RuntimeException{

    public DuplicateSubmitException(String msg) {
        super(msg);
    }

    public DuplicateSubmitException(String msg, Throwable cause){
        super(msg,cause);
    }

}
