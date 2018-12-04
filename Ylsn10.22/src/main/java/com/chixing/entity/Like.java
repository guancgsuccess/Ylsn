package com.chixing.entity;

import java.io.Serializable;

public class Like  implements Serializable {
    private Integer likeId;
    private Integer likedId;

    public Like() {
    }

    public Like(Integer likeId, Integer likedId) {
        this.likeId = likeId;
        this.likedId = likedId;
    }

    public Integer getLikeId() {
        return likeId;
    }

    public void setLikeId(Integer likeId) {
        this.likeId = likeId;
    }

    public Integer getLikedId() {
        return likedId;
    }

    public void setLikedId(Integer likedId) {
        this.likedId = likedId;
    }

    @Override
    public String toString() {
        return "Like{" +
                "likeId=" + likeId +
                ", likedId=" + likedId +
                '}';
    }
}
