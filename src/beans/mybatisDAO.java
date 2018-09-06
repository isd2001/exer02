package beans;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.builder.SqlSourceBuilder;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class mybatisDAO {
	SqlSessionFactory factory;

	public mybatisDAO() throws IOException {
		SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
		InputStream is = Resources.getResourceAsStream("config.xml");
		factory=builder.build(is);	
	}


	public List<Map> getAllboard() {
		SqlSession sql = factory.openSession();
		try {
			List<Map> p= sql.selectList("resert.getAllDate");
			return p;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public int addboardResult(Map param) {
		SqlSession sql= factory.openSession();		// JDBCÀÇ Connect °úÁ¤	
		try {
			int r=  sql.insert("resert.addboardMap",param);
			if (r==1) {
				sql.commit();
			}
			return r;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	public Map getOneView(String no) {
		SqlSession session = factory.openSession();
		try {
			Map p = session.selectOne("resert.getOneView",no);
			return p;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public int upGoodByNo(String no) {
		SqlSession sql = factory.openSession();
		try {
			int r=sql.update("resert.upGoodByNo",no);
			if (r==1) {
				sql.commit();
			}
			return r;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	
	
	public int addGoodlog(Map param) {
		SqlSession sql = factory.openSession();
		try {
			int r = sql.insert("resert.addGoodlog",param);
			if (r==1) {
				sql.commit();
			}
			return r;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	
	

}//end class
