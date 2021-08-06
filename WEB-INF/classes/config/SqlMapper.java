package config;

import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

public class SqlMapper {
	private static SqlMapClient sqlMapper;
	
	static{
		try{
			Reader reader = Resources.getResourceAsReader("config/sqlMapConfig.xml");
			sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
			reader.close();
		}catch(Exception e){
			System.out.println("SqlMapper Ex : "+e.getMessage());
		}
	}
	
	public static SqlMapClient getMapper(){
		return sqlMapper;
	}
}
