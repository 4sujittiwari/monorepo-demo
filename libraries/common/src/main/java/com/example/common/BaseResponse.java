package com.example.common;

import lombok.Data;

@Data
public class BaseResponse<T> {
    private String status;
    private String message;
    private T data;

    public static <T> BaseResponse<T> success(T data) {
        BaseResponse<T> response = new BaseResponse<>();
        response.setStatus("SUCCESS");
        response.setData(data);
        return response;
    }
}
