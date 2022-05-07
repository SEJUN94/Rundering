package com.rundering.dao;

import java.sql.SQLException;
import java.util.List;

import com.rundering.dto.AttachVO;

public interface AttachDAO {
	public void insertOrderGoodsAtach(AttachVO attach) throws Exception;
	
	public int selectFileNo() throws Exception;
	
	public List<AttachVO> selectAttachByArticlesCode(int atchFileNo) throws Exception;
	public void insertAttach(AttachVO attach) throws SQLException;
	public List<AttachVO> selectAttachVOByFileNo(String fileNo) throws Exception;
	public  void deleteAttchFileRemoveByFileNo(String fileNo) throws Exception;
	// 파일번호의 시퀸스를 구하기위해 받아오는 DAO
	public int getAttachNoSeq(String atchFileNo) throws Exception;
	// 수거 및 배송 취소시 업로드된 이미지 삭제
	public void deleteDeliveryPicture(AttachVO attach)throws Exception;
	// 파일다운로드를 위한 해당 파일의 정보가져오기
	public AttachVO getAttachForDownload(AttachVO attach) throws Exception;

}


