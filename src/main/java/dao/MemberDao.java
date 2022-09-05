package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dto.Member;


public class MemberDao {

	
	private DataSource datasource;
	private SqlSessionFactory sqlSessionFactory;

	public void setDataSource(DataSource dataSource, SqlSessionFactory sqlSessionFactory) {
		this.datasource = dataSource;
		this.sqlSessionFactory = sqlSessionFactory;
	}

	public List<Member> selectList() throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			return sqlSession.selectList("dao.MemberDao.selectList");

		} finally {
			sqlSession.close();
		}
	}

	public Member exist(String email, String pwd) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			return sqlSession.selectOne("dao.MemberDao.select", new Member().setEmail(email).setPwd(pwd));
		} finally {
			sqlSession.close();
		}
	}

	public int update(Member member) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			int count = sqlSession.update("dao.MemberDao.update", member);
			sqlSession.commit();
			return count;
		} catch (Exception e) {
			sqlSession.rollback();// �떎�뙣�뻽�쓣 寃쎌슦 �궡由� 紐낅젰�쓣 痍⑥냼�븯寃좊떎.
		} finally {
			sqlSession.close();
		}
		return -1;
	}

	public Member selecteOne(String email) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			return sqlSession.selectOne("dao.MemberDao.selectOne", email);
		} finally {
			sqlSession.close();
		}
	}

	public int delete(String email) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			int count = sqlSession.delete("dao.MemberDao.delete", email);
			sqlSession.commit();
			return count;
		} catch (Exception e) {
			sqlSession.rollback();// �떎�뙣�뻽�쓣 寃쎌슦 �궡由� 紐낅젰�쓣 痍⑥냼�븯寃좊떎.
		} finally {
			sqlSession.close();
		}
		return -1;
	}

	public int insert(Member member) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			int count = sqlSession.insert("dao.MemberDao.insert", member);
			System.out.println(member.getZip_num());
			sqlSession.commit();
			return count;
		} catch (Exception e) {
			sqlSession.rollback();// �떎�뙣�뻽�쓣 寃쎌슦 �궡由� 紐낅젰�쓣 痍⑥냼�븯寃좊떎.
		} finally {
			sqlSession.close();
		}
		return -1;
	}

	public int emailcheck(String email) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		return sqlSession.selectOne("dao.MemberDao.emailcheck", email);
	}

	public Member findemail(String name, String phone) {
		SqlSession sqlSession = sqlSessionFactory.openSession();

		try {
			return sqlSession.selectOne("dao.MemberDao.findemail", new Member().setName(name).setPhone(phone));
		} finally {
			sqlSession.close();
		}

	}

	public Member findpwd(String email, String phone) {
		SqlSession sqlSession = sqlSessionFactory.openSession();

		try {
			return sqlSession.selectOne("dao.MemberDao.findpwd", new Member().setEmail(email).setPhone(phone));
		} finally {
			sqlSession.close();
		}

	}
	
	
	public int pwdupdate(String pw, String email) throws Exception{
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		Map<String,Object> map = new HashMap<>();
		
		map.put("pw", pw);
		map.put("email", email);
		
		try {
			int count = sqlSession.update("dao.MemberDao.pwdupdate", map);
			sqlSession.commit();
			return count;
		} catch (Exception e) {
			sqlSession.rollback();// �떎�뙣�뻽�쓣 寃쎌슦 �궡由� 紐낅젰�쓣 痍⑥냼�븯寃좊떎.
		} finally {
			sqlSession.close();
		}
		return -1;
		
	}
}
