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
//			// select statement �� �ΰ��� ������� ȣ���� �Ѵ�.
//			// selectOne (����ϴ� �����Ͱ�  �ְų� ���ų�) => resultType 
//			// selectList(����ϴ� �������� ������ ������) => List<resultType>
//			List<Map> p= sql.selectList("baseresult.getAllDataUsingMap");
//			// selectList �� ���� ��쿣 , �̰� �����Ͱ� ���ٸ� size 0 ¥�� List�� ��ȯ��.
//			return p;		
//		} catch (Exception e) {
//			e.printStackTrace();
//			return null;
//		}
//	}
	
	public int addboardResult(Map param) {
		SqlSession sql= factory.openSession();		// JDBC�� Connect ����	
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
