package br.com.qintess.comercio.config;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

//classe iniciada automaticamente pelo Spring que ir� realizar todas as configura��es necess�rias.
public class AppInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {

	@Override
	protected Class<?>[] getRootConfigClasses() {// M�todo que configura componentes externos como o hibernate
			return new Class[] {
					HibernateConfig.class
			};
	
	}

	@Override
	protected Class<?>[] getServletConfigClasses() { // M�todo que configura o MVC do spring
		return new Class[] {
		WebMvcConfig.class
		};
	}

	@Override
	protected String[] getServletMappings() {// M�todo que configura o mapeamento do servlet
		return new String[] {
			"/"	
		};
	}

}
