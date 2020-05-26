package br.com.qintess.comercio.config;

import javax.servlet.Filter;

import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

//classe iniciada automaticamente pelo Spring que ir� realizar todas as configura��es necess�rias.
public class AppInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {

	@Override
	protected Class<?>[] getRootConfigClasses() {// M�todo que configura componentes externos como o hibernate
			return new Class[] {
					WebMvcConfig.class,
					HibernateConfig.class,
					WebSecurityConfig.class
			};
	
	}

	@Override
	protected Class<?>[] getServletConfigClasses() { // M�todo que configura o MVC do spring
		return new Class[] {
		};
	}

	@Override
	protected String[] getServletMappings() {// M�todo que configura o mapeamento do servlet
		return new String[] {
			"/"	
		};
	}

	protected Filter[] getServletFilters() {
		CharacterEncodingFilter characterEncodingFilter = new CharacterEncodingFilter();
		characterEncodingFilter.setEncoding("UTF-8");
		return new Filter[] {characterEncodingFilter};
	}
}
