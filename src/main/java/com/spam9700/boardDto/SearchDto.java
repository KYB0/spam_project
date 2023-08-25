package com.spam9700.boardDto;

import lombok.Data;

@Data
public class SearchDto {
    private String cname;
    private String kword;
    private int pagenum;
    private int listcnt;
}
