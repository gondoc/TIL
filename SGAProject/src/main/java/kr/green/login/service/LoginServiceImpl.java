/**
 * 
 */
package kr.green.login.service;


import java.util.HashMap;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.green.login.dao.MemberDAO;
import kr.green.login.dao.MemberDAOImpl;
import kr.green.login.dao.PersonDAO;
import kr.green.login.dao.PersonDAOImpl;
import kr.green.login.vo.MemberVO;
import kr.green.login.vo.PersonVO;
import kr.green.mybatis.MybatisApp;
import lombok.extern.log4j.Log4j;

/**
 * @author HanKyul
 *
 */
@Log4j
public class LoginServiceImpl implements LoginService {
	private static LoginService instance = new LoginServiceImpl();

	private LoginServiceImpl() {
		;
	}
	public static LoginService getInstance() {
		return instance;
	}

//-----------------------------------------------------------------------
	@Override
	public void welcomeMember(MemberVO memberVO) {
		log.debug("welcomeMember 호출 : " + memberVO);
		SqlSession sqlSession = null;
		MemberDAO memberDAO = MemberDAOImpl.getInstance();
		try {
			sqlSession = MybatisApp.getSqlSessionFactory().openSession(false);
			// -----------------------------------------------------------------
			// 2. 바뀌는 부분 -- dao를 호출하여 로직을 수행하는 부분
			if (memberVO != null) {
				memberDAO.welcomeMember(sqlSession, memberVO);
			}
			// -----------------------------------------------------------------
			sqlSession.commit();
		} catch (Exception e) {
			sqlSession.rollback();
			e.printStackTrace();
		} finally {
			if (sqlSession != null)
				sqlSession.close();
		}
		// ------------------------------------------------------------------------------------
		// 3. 바뀌는 부분 -- 하단의 로그와 리턴값
		log.debug("welcomeMember 리턴 : " + memberVO);
	}

	@Override
	public MemberVO getMember(int idx) {
		// 1. 바뀌는 부분 -- 상단의 로그와 리턴 타입 변수 부분
		log.debug("getMember 호출 : " + idx);
		MemberVO memberVO = null;
		//-----------------------------------------------------------------------
		SqlSession sqlSession = null;
		MemberDAO memberDAO = MemberDAOImpl.getInstance();
		PersonDAO personDAO = PersonDAOImpl.getInstance();
		// ------------------------------------------------------------------------------------
	
		try {
			sqlSession = MybatisApp.getSqlSessionFactory().openSession(false);
			// -----------------------------------------------------------------
			memberVO = memberDAO.getMember(sqlSession, idx); // 1) 해당 글번호 글을 읽어오기
			if (memberVO != null) {
				List<PersonVO> list = personDAO.getBmi(sqlSession, memberVO.getIdx());
				memberVO.setBmiList(list);
			}
			// -----------------------------------------------------------------
			sqlSession.commit();
		} catch (Exception e) {
			sqlSession.rollback();
			e.printStackTrace();
		} finally {
			if (sqlSession != null)
				sqlSession.close();
		}
		// ------------------------------------------------------------------------------------
		// 3. 바뀌는 부분 -- 하단의 로그와 리턴값
		log.debug("getMember 리턴 : " + memberVO);
		return memberVO;
	}

	@Override
	public void update(MemberVO memberVO) {
		// 1. 바뀌는 부분 -- 상단의 로그와 리턴 타입 변수 부분
		log.debug("update 호출 : " + memberVO);
		// ------------------------------------------------------------------------------------
		SqlSession sqlSession = null;
		MemberDAO memberDAO = MemberDAOImpl.getInstance();
		try {
			sqlSession = MybatisApp.getSqlSessionFactory().openSession(false);
			// -----------------------------------------------------------------
			if (memberVO != null) {
				memberDAO.updateMember(sqlSession, memberVO);
			}
			// -----------------------------------------------------------------
			sqlSession.commit();
		} catch (Exception e) {
			sqlSession.rollback();
			e.printStackTrace();
		} finally {
			if (sqlSession != null)
				sqlSession.close();
		}
		// ------------------------------------------------------------------------------------
		// 3. 바뀌는 부분 -- 하단의 로그와 리턴값
		log.debug("update 리턴 : " + memberVO);
	}

	@Override
	public void delete(int idx) {
		// 1. 바뀌는 부분 -- 상단의 로그와 리턴 타입 변수 부분
		log.debug("delete 호출 : " + idx);
		// ------------------------------------------------------------------------------------
		SqlSession sqlSession = null;
		MemberDAO memberDAO = MemberDAOImpl.getInstance();
		PersonDAO personDAO = PersonDAOImpl.getInstance();
		try {
			sqlSession = MybatisApp.getSqlSessionFactory().openSession(false);
			// -----------------------------------------------------------------
			// 2. 바뀌는 부분 -- dao를 호출하여 로직을 수행하는 부분
			if (getMember(idx) != null) {
				personDAO.deleteAllBmi(sqlSession, idx); 
				memberDAO.delete(sqlSession, idx);
			}
			// -----------------------------------------------------------------
			sqlSession.commit();
		} catch (Exception e) {
			sqlSession.rollback();
			e.printStackTrace();
		} finally {
			if (sqlSession != null)
				sqlSession.close();
		}
		// ------------------------------------------------------------------------------------
		// 3. 바뀌는 부분 -- 하단의 로그와 리턴값
		log.debug("delete 리턴 : ");
	}

	@Override
	public String findId(String email, String name, String phone) {
		// 1. 바뀌는 부분 -- 상단의 로그와 리턴 타입 변수 부분
		log.debug("findId 호출 : " + email + ", " + name + ", " + phone);
		String foundId = "";
		//-----------------------------------------------------------------------
		SqlSession sqlSession = null;
		MemberDAO memberDAO = MemberDAOImpl.getInstance();
//		PersonDAO personDAO = PersonDAOImpl.getInstance();
		// ------------------------------------------------------------------------------------
		try {
			sqlSession = MybatisApp.getSqlSessionFactory().openSession(false);
			// -----------------------------------------------------------------
			if (email != null && email != "" && name != null && name != "" && phone != null && phone != "") {
				HashMap<String, String> map = new HashMap<String, String>();
				map.put("email", email);
				map.put("name", name);
				map.put("phone", phone);
				if (memberDAO.findIdCheck(sqlSession, map) == 1) {
					foundId = memberDAO.findId(sqlSession, map);
				}
			}
			// -----------------------------------------------------------------
			sqlSession.commit();
		} catch (Exception e) {
			sqlSession.rollback();
			e.printStackTrace();
		} finally {
			if (sqlSession != null)
				sqlSession.close();
		}
		// ------------------------------------------------------------------------------------
		// 3. 바뀌는 부분 -- 하단의 로그와 리턴값
		log.debug("findId 리턴 : " + foundId);
		return foundId;
	}
	
	@Override
	public String findPw(String id, String name, String birth, String phone) {
		// 1. 바뀌는 부분 -- 상단의 로그와 리턴 타입 변수 부분
		log.debug("findPw 호출 : " + id + ", " + name + ", " + birth + ", " + phone);
		String foundPw = "";
		//-----------------------------------------------------------------------
		SqlSession sqlSession = null;
		MemberDAO memberDAO = MemberDAOImpl.getInstance();
//		PersonDAO personDAO = PersonDAOImpl.getInstance();
		// ------------------------------------------------------------------------------------
		try {
			sqlSession = MybatisApp.getSqlSessionFactory().openSession(false);
			// -----------------------------------------------------------------
			if (id != null && id != "" && name != null && name != "" && birth != null && birth != "" && phone != null && phone != "") {
				HashMap<String, String> map = new HashMap<String, String>();
				map.put("id", id);
				map.put("name", name);
				map.put("birth", birth);
				map.put("phone", phone);
				if (memberDAO.findPassCheck(sqlSession, map) == 1) {
					foundPw = memberDAO.findPw(sqlSession, map);
				}
			}
			// -----------------------------------------------------------------
			sqlSession.commit();
		} catch (Exception e) {
			sqlSession.rollback();
			e.printStackTrace();
		} finally {
			if (sqlSession != null)
				sqlSession.close();
		}
		// ------------------------------------------------------------------------------------
		// 3. 바뀌는 부분 -- 하단의 로그와 리턴값
		log.debug("findPw 리턴 : " + foundPw);
		return foundPw;
	}

	@Override
	public void updatePassword(MemberVO memberVO) {
		// 1. 바뀌는 부분 -- 상단의 로그와 리턴 타입 변수 부분
		log.debug("updatePassword 호출 : " + memberVO);
		//-----------------------------------------------------------------------
		SqlSession sqlSession = null;
		MemberDAO memberDAO = MemberDAOImpl.getInstance();
		// ------------------------------------------------------------------------------------
		try {
			sqlSession = MybatisApp.getSqlSessionFactory().openSession(false);
			// -----------------------------------------------------------------
			memberVO = memberDAO.getMember(sqlSession, memberVO.getIdx()); // 1) 해당 글번호 글을 읽어오기
			if (memberVO != null) {
				HashMap<String, String> map = new HashMap<String, String>();
				map.put("idx", "" + memberVO.getIdx());
				map.put("birth", memberVO.getBirth());
				map.put("id", memberVO.getId());
				map.put("name", memberVO.getName());
				map.put("phone", memberVO.getPhone());
				if (memberDAO.findPassCheck(sqlSession, map) == 1) {
					memberDAO.updatePassword(sqlSession, memberVO);
				}
			}
			// -----------------------------------------------------------------
			sqlSession.commit();
		} catch (Exception e) {
			sqlSession.rollback();
			e.printStackTrace();
		} finally {
			if (sqlSession != null)
				sqlSession.close();
		}
		// ------------------------------------------------------------------------------------
		// 3. 바뀌는 부분 -- 하단의 로그와 리턴값
		log.debug("updatePassword 리턴 : " + memberVO);
	}

	@Override
	public void insertBmi(PersonVO personVO) {
		// 1. 바뀌는 부분 -- 상단의 로그와 리턴 타입 변수 부분
		log.debug("insertBmi 호출 : " + personVO);
		// ------------------------------------------------------------------------------------
		SqlSession sqlSession = null;
		PersonDAO personDAO = PersonDAOImpl.getInstance();
		try {
			sqlSession = MybatisApp.getSqlSessionFactory().openSession(false);
			// -----------------------------------------------------------------
			// 2. 바뀌는 부분 -- dao를 호출하여 로직을 수행하는 부분
			if (personVO != null) {
				personDAO.saveBmi(sqlSession, personVO);
			}
			// -----------------------------------------------------------------
			sqlSession.commit();
		} catch (Exception e) {
			sqlSession.rollback();
			e.printStackTrace();
		} finally {
			if (sqlSession != null)
				sqlSession.close();
		}
		// ------------------------------------------------------------------------------------
		// 3. 바뀌는 부분 -- 하단의 로그와 리턴값
		log.debug("insertBmi 리턴 : " + personVO);
	}

	@Override
	public void deleteBmi(int idx) {
		// 1. 바뀌는 부분 -- 상단의 로그와 리턴 타입 변수 부분
		log.debug("deleteBmi 호출 : " + idx);
		// ------------------------------------------------------------------------------------
		SqlSession sqlSession = null;
		PersonDAO personDAO = PersonDAOImpl.getInstance();
		try {
			sqlSession = MybatisApp.getSqlSessionFactory().openSession(false);
			// -----------------------------------------------------------------
			// 2. 바뀌는 부분 -- dao를 호출하여 로직을 수행하는 부분
			if(personDAO.getBmi(sqlSession, idx) != null){
				personDAO.deleteBmi(sqlSession, idx);
			}
			// -----------------------------------------------------------------
			sqlSession.commit();
		} catch (Exception e) {
			sqlSession.rollback();
			e.printStackTrace();
		} finally {
			if (sqlSession != null)
				sqlSession.close();
		}
		// ------------------------------------------------------------------------------------
		// 3. 바뀌는 부분 -- 하단의 로그와 리턴값
		log.debug("deleteBmi 리턴 : ");
	}
	@Override
	public String memberLogin(MemberVO memberVO) {
		// 1. 바뀌는 부분 -- 상단의 로그와 리턴 타입 변수 부분
		log.debug("memberLogin 호출 : " + memberVO);
		// ------------------------------------------------------------------------------------
		SqlSession sqlSession = null;
		String nickName = "";
		MemberDAO memberDAO = MemberDAOImpl.getInstance();
		try {
			sqlSession = MybatisApp.getSqlSessionFactory().openSession(false);
			// -----------------------------------------------------------------
			// 2. 바뀌는 부분 -- dao를 호출하여 로직을 수행하는 부분
			if (memberVO != null) {
				HashMap<String, String> map = new HashMap<String, String>();
				map.put("idx", "" + memberVO.getIdx());
				map.put("id", memberVO.getId());
				map.put("password", memberVO.getPassword());
				nickName = memberDAO.memberLogin(sqlSession, map);
			}
			// -----------------------------------------------------------------
			sqlSession.commit();
		} catch (Exception e) {
			sqlSession.rollback();
			e.printStackTrace();
		} finally {
			if (sqlSession != null)
				sqlSession.close();
		}
		// ------------------------------------------------------------------------------------
		// 3. 바뀌는 부분 -- 하단의 로그와 리턴값
		log.debug("memberLogin 리턴 : " + nickName);
		return nickName;
	}
	@Override
	public int selectIdx(String id, String password) {
		// 1. 바뀌는 부분 -- 상단의 로그와 리턴 타입 변수 부분
		log.debug("selectIdx 호출 : " + id + ", " + password);
		// ------------------------------------------------------------------------------------
		SqlSession sqlSession = null;
		int idx = 0;
		MemberDAO memberDAO = MemberDAOImpl.getInstance();
		try {
			sqlSession = MybatisApp.getSqlSessionFactory().openSession(false);
			// -----------------------------------------------------------------
			// 2. 바뀌는 부분 -- dao를 호출하여 로직을 수행하는 부분
			if (id != null && id != "" && password != null && password != "") {
				HashMap<String, String> map = new HashMap<String, String>();
				map.put("id", id);
				map.put("password", password);
				idx = memberDAO.selectIdx(sqlSession, map);
			}
			// -----------------------------------------------------------------
			sqlSession.commit();
		} catch (Exception e) {
			sqlSession.rollback();
			e.printStackTrace();
		} finally {
			if (sqlSession != null)
				sqlSession.close();
		}
		// ------------------------------------------------------------------------------------
		// 3. 바뀌는 부분 -- 하단의 로그와 리턴값
		log.debug("selectIdx 리턴 : " + idx);
		return idx;
	}
}
