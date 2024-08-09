package model;

public class Board {
private String boardNo;
private String title;
public String getBoardNo() {
	return boardNo;
}

public String getTitle() {
	return title;
}

public String getContents() {
	return contents;
}

public String getUserId() {
	return userId;
}

private String contents;
private String userId;
 
 public Board(String boardNo) {
     this.boardNo = boardNo;
 }

 public Board(String boardNo, String title, String contents, String userId) {
	 this.boardNo = boardNo;
	 this.title = title;
	 this.contents = contents;
	 this.userId = userId;
 }
}