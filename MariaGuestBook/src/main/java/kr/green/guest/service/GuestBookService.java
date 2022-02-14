package kr.green.guest.service;

import java.sql.Connection;
import java.util.List;

import kr.green.guest.dao.GuestBookDAO;
import kr.green.guest.vo.GuestBookVO;
import kr.green.guest.vo.PagingVO;
import kr.green.jdbc.JDBCUtil;
import lombok.extern.log4j.Log4j2;

@Log4j2
public class GuestBookService {
	// --------------------------------------------------------------
	// 싱글톤 패턴을 만들자
	// 1. 자기 자신의 객체를 정적 멤버로 가진다.
	private static GuestBookService instance = new GuestBookService();
	// 2. 밖에서 객체를 생성하지 못하도록 생성자를 private로 만든다.
	private GuestBookService() {}
	// 3. 밖에서 객체를 얻는 메서드를 만든다.
	public static GuestBookService getInstance() {
		return instance;
	}
	
	// --------------------------------------------------------------
	// 로직 1개당 1개의 메서드
	// 1. 목록보기 -- 1페이지 분량의 글을 가져온다.
	public PagingVO<GuestBookVO> selectList(int currentPage, int pageSize, int blockSize){
		log.debug("selectList 호출 : " + currentPage + ", " + pageSize + ", " + blockSize);
		PagingVO<GuestBookVO> pagingVO = null;
		Connection conn = null;
		GuestBookDAO dao = null;
		try {
			conn = JDBCUtil.getConnection();
			conn.setAutoCommit(false);
			dao = GuestBookDAO.getInstance();
			// --------------------------------------------------------
			
			int totalCount = dao.selectCount(conn); // 전체 개수 구하기
			pagingVO = new PagingVO<GuestBookVO>(currentPage, pageSize, blockSize, totalCount); // 페이지 계산완료
			
			if(totalCount>0) {
				List<GuestBookVO> list = dao.selectList(conn, pagingVO.getStartNo(), pagingVO.getPageSize());
				// 가져온 리스트를 pagingVO에 넣는다.
				pagingVO.setList(list);
			}
			
			// --------------------------------------------------------
			conn.commit();
		}catch (Exception e) {
			JDBCUtil.rollback(conn);
			e.printStackTrace();
		}finally {
			JDBCUtil.close(conn);
		}
		log.debug("selectList 리턴 : " + pagingVO);
		return pagingVO;
	}
	// 2. 1개 얻기 -- 수정/삭제할때 보여줘야 한다.
	public GuestBookVO selectByIdx(int idx) {
		GuestBookVO vo = null;
		Connection conn = null;
		GuestBookDAO dao = null;
		try {
			conn = JDBCUtil.getConnection();
			conn.setAutoCommit(false);
			dao = GuestBookDAO.getInstance();
			// --------------------------------------------------------
			vo = dao.selectByIdx(conn, idx);
			// --------------------------------------------------------
			conn.commit();
		}catch (Exception e) {
			JDBCUtil.rollback(conn);
			e.printStackTrace();
		}finally {
			JDBCUtil.close(conn);
		}
		return vo;
	}
	// 3. 저장하기
	public int insert(GuestBookVO vo) {
		log.debug("insert 호출 : " + vo);
		int count = 0;
		Connection conn = null;
		GuestBookDAO dao = null;
		try {
			conn = JDBCUtil.getConnection();
			conn.setAutoCommit(false);
			dao = GuestBookDAO.getInstance();
			// --------------------------------------------------------
			if(vo!=null) { // 넘어온 데이터가 있다면
				if(vo.getName()!=null && vo.getName().trim().length()>0) { // 이름이 있다면
					if(vo.getPassword()!=null && vo.getPassword().trim().length()>0) { // 비번이 있다면
						if(vo.getContent()!=null && vo.getContent().trim().length()>0) { // 내용이 있다면
							count = dao.insert(conn, vo);
						}
					}
				}
			}
			
			// --------------------------------------------------------
			conn.commit();
		}catch (Exception e) {
			JDBCUtil.rollback(conn);
			e.printStackTrace();
		}finally {
			JDBCUtil.close(conn);
		}
		log.debug("insert 리턴 : " + count);
		return count;
	}
	// 4. 수정하기
	public int update(GuestBookVO vo) {
		int count = 0;
		Connection conn = null;
		GuestBookDAO dao = null;
		try {
			conn = JDBCUtil.getConnection();
			conn.setAutoCommit(false);
			dao = GuestBookDAO.getInstance();
			// --------------------------------------------------------
			// 넘어온 데이터가 있으면서 db에 저장된 비번이 일치하면 수정
			if(vo!=null) { // 넘어온 데이터가 있으면서 
				if(dao.passwordCheck(conn, vo.getIdx(), vo.getPassword())==1) { // db에 저장된 비번이 일치하면 수정
					dao.update(conn, vo);
				}
			}
			// --------------------------------------------------------
			conn.commit();
		}catch (Exception e) {
			JDBCUtil.rollback(conn);
			e.printStackTrace();
		}finally {
			JDBCUtil.close(conn);
		}
		return count;
	}
	// 5. 삭제하기
	public int delete(GuestBookVO vo) { // 비밀번호가 같으면 지워주기 위해서 idx값을 넘겨주지 않고 vo만 넘겨준다.
		int count = 0;
		Connection conn = null;
		GuestBookDAO dao = null;
		try {
			conn = JDBCUtil.getConnection();
			conn.setAutoCommit(false);
			dao = GuestBookDAO.getInstance();
			// --------------------------------------------------------
			// 넘어온 데이터가 있으면서 db에 저장된 비번이 일치하면 삭제
			if(vo!=null) { // 넘어온 데이터가 있으면서 
				if(dao.passwordCheck(conn, vo.getIdx(), vo.getPassword())==1) { // db에 저장된 비번이 일치하면 수정
					dao.delete(conn, vo.getIdx());
				}
			}
			// --------------------------------------------------------
			conn.commit();
		}catch (Exception e) {
			JDBCUtil.rollback(conn);
			e.printStackTrace();
		}finally {
			JDBCUtil.close(conn);
		}
		return count;
	}
}
