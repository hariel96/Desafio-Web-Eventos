package br.com.qintess.comercio.config;

import javax.servlet.Filter;

import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

//classe iniciada automaticamente pelo Spring que irá realizar todas as configurações necessárias.
public class AppInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {

	@Override
	protected Class<?>[] getRootConfigClasses() {// Método que configura componentes externos como o hibernate
			return new Class[] {
					WebMvcConfig.class,
					HibernateConfig.class,
					WebSecurityConfig.class
			};
	
	}

	@Override
	protected Class<?>[] getServletConfigClasses() { // Método que configura o MVC do spring
		return new Class[] {
		};
	}

	@Override
	protected String[] getServletMappings() {// Método que configura o mapeamento do servlet
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
