package com.chixing.util;

import java.util.List;

public class PageModel<T> {
    /**
     * 1. 每页显示记录数
     * 2. 总记录数
     * 3. 总页数
     * 4. 当前页码
     * 5. 从第几条记录开始显示
     * 6. 到第几条记录结束显示
     * 7. 当前页显示记录对象集合
     */
    private  Integer pageSize = 3;  //每页显示记录数
    private Integer totalRecord ; //总记录数
    private Integer totalPages; //总页数
    private Integer currentPageCode; //当前页码
    private Integer startRecord; //从第几条记录开始显示
    private Integer endRecord; // 到第几条记录结束显示
    private List<T> modelList;  //当前页显示记录对象集合
    private Integer messToId;
    private Integer messFromId;

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public Integer getTotalRecord() {
        return totalRecord;
    }

    public void setTotalRecord(Integer totalRecord) {
        this.totalRecord = totalRecord;
    }

    public Integer getTotalPages() {
        return totalPages;
    }

    public void setTotalPages(Integer totalPages) {
        this.totalPages = totalPages;
    }

    public Integer getCurrentPageCode() {
        return currentPageCode;
    }

    public void setCurrentPageCode(Integer currentPageCode) {
        this.currentPageCode = currentPageCode;
    }

    public Integer getStartRecord() {
        return startRecord;
    }

    public void setStartRecord(Integer startRecord) {
        this.startRecord = startRecord;
    }

    public Integer getEndRecord() {
        return endRecord;
    }

    public void setEndRecord(Integer endRecord) {
        this.endRecord = endRecord;
    }

    public List<T> getModelList() {
        return modelList;
    }

    public void setModelList(List<T> modelList) {
        this.modelList = modelList;
    }

    public Integer getMessToId() {
        return messToId;
    }

    public void setMessToId(Integer messToId) {
        this.messToId = messToId;
    }

    public Integer getMessFromId() {
        return messFromId;
    }

    public void setMessFromId(Integer messFromId) {
        this.messFromId = messFromId;
    }

    @Override
    public String toString() {
        return "PageModel{" +
                "pageSize=" + pageSize +
                ", totalRecord=" + totalRecord +
                ", totalPages=" + totalPages +
                ", currentPageCode=" + currentPageCode +
                ", startRecord=" + startRecord +
                ", endRecord=" + endRecord +
                ", modelList=" + modelList +
                ", messToId=" + messToId +
                ", messFromId=" + messFromId +
                '}';
    }
}
