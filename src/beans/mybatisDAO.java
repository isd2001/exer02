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
	
//	
//	public List<Map> getAllResult() {
//		SqlSession sql = factory.openSession();
//		try {
//			// select statement 는 두가지 방식으로 호출을 한다.
//			// selectOne (기대하는 데이터가  있거나 없거나) => resultType 
//			// selectList(기대하는 데이터의 개수가 여러개) => List<resultType>
//			List<Map> p= sql.selectList("baseresult.getAllDataUsingMap");
//			// selectList 로 쓰는 경우엔 , 이게 데이터가 없다면 size 0 짜리 List를 반환함.
//			return p;		
//		} catch (Exception e) {
//			e.printStackTrace();
//			return null;
//		}
//	}
	
	public int addboardResult(Map param) {
		SqlSession sql= factory.openSession();		// JDBC의 Connect 과정	
		try {
			int r=  sql.insert("resert.addDateboardMap",param);
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
