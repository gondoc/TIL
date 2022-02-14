package kr.green.board.vo;

import java.util.Date;

import javax.xml.bind.annotation.XmlRootElement;

import lombok.Data;

/*
-- 댓글 테이블
create table comment(
   idx int primary key auto_increment,
   ref int not null, -- 원본글 번호
   name varchar(30) not null,
   password varchar(50) not null,
   content text not null,
   regDate timestamp default now(),
   ip varchar(20) not null,
   FOREIGN KEY(ref) REFERENCES board2(idx) -- 외래키 지정   
); 
*/

@Data
@XmlRootElement
public class CommentVO {
	private int idx;
	private int ref;
	private String name;
	private String password;
	private String content;
	private Date   regDate;
	private String ip;
	
}
