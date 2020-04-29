package br.com.qintess.comercio.config;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

//classe iniciada automaticamente pelo Spring que irá realizar todas as configurações necessárias.
public class AppInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {

	@Override
	protected Class<?>[] getRootConfigClasses() {// Método que configura componentes externos como o hibernate
			return new Class[] {
					HibernateConfig.class
			};
	
	}

	@Override
	protected Class<?>[] getServletConfigClasses() { // Método que configura o MVC do spring
		return new Class[] {
		WebMvcConfig.class
		};
	}

	@Override
	protected String[] getServletMappings() {// Método que configura o mapeamento do servlet
		return new String[] {
			"/"	
		};
	}

}
