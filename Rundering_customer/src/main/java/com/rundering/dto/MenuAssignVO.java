package com.rundering.dto;

public class MenuAssignVO {
    private String authGrpCode; //권한그룹코드
	private String menuId;      //메뉴ID
	private String readYn;      //읽기가능여부
	private String writeYn;     //쓰기가능여부
	private String deleteYn;    //삭제가능여부

	public String getAuthGrpCode() {
		return authGrpCode;
	}
	public void setAuthGrpCode(String authGrpCode) {
		this.authGrpCode = authGrpCode;
	}
	public String getMenuId() {
		return menuId;
	}
	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}
	public String getReadYn() {
		return readYn;
	}
	public void setReadYn(String readYn) {
		this.readYn = readYn;
	}
	public String getWriteYn() {
		return writeYn;
	}
	public void setWriteYn(String writeYn) {
		this.writeYn = writeYn;
	}
	public String getDeleteYn() {
		return deleteYn;
	}
	public void setDeleteYn(String deleteYn) {
		this.deleteYn = deleteYn;
	}
	
	
	
	
}
