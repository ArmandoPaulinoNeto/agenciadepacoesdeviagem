package br.com.isoftware.rotatour.model.repository;

import java.lang.reflect.ParameterizedType;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import br.com.isoftware.rotatour.util.HibernateUtil;

public class GerericRepository<Entidade> {
	
	private Class<Entidade> classe;
	 
	@SuppressWarnings("unchecked")
	public GerericRepository() {

		this.classe = (Class<Entidade>) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0];
	}

	public Entidade salvar(Entidade entidade) {
		
		Session sessao = HibernateUtil.getFabricaDeSessoes().openSession();
		Transaction transacao = null;
		
		try {
			transacao = sessao.beginTransaction();
			sessao.save(entidade);
			transacao.commit();
			return entidade;
		} catch (RuntimeException e) {
			System.out.println(e.toString());
			// TODO: handle exception
			if (transacao != null)
				transacao.rollback();
			throw e;
		} finally {
			sessao.close();
		}
	}
	@SuppressWarnings("unchecked")
	public List<Entidade> listar(){
		
		Session sessao = HibernateUtil.getFabricaDeSessoes().openSession();
		
		try {
			Criteria consulta = sessao.createCriteria(this.classe);
			 List<Entidade> resultado = consulta.list();
			 return resultado;
			 
		} catch (RuntimeException e) {
			System.out.println(e.toString());
			// TODO: handle exception			 
			throw e;
		} finally {
			sessao.close();
		}
	}
	@SuppressWarnings("unchecked")
	public Entidade retornaEntidade(){
		
		Session sessao = HibernateUtil.getFabricaDeSessoes().openSession();
		
		try {
			 Criteria consulta = sessao.createCriteria(this.classe);
			 Entidade entidade = null;
			 List<Entidade> resultado = consulta.list();
			 for (Entidade resul : resultado) {
				 	entidade = resul;
			 }
			 return entidade;			 
		} catch (RuntimeException e) {
			System.out.println(e.toString());
			// TODO: handle exception			 
			throw e;
		} finally {
			sessao.close();
		}
	}
	@SuppressWarnings("unchecked")
	public  Entidade buscar(long codigo){
		
		Session sessao = HibernateUtil.getFabricaDeSessoes().openSession();
		
		try {
			 Criteria consulta = sessao.createCriteria(this.classe);
			 consulta.add(Restrictions.idEq(codigo));
			 Entidade resultado = (Entidade) consulta.uniqueResult();
			 return resultado;
			 
		} catch (RuntimeException e) {
			
			// TODO: handle exception			 
			throw e;
		} finally {
			sessao.close();
		}
	}
	@SuppressWarnings("unchecked")
	public List<Entidade> buscarPorNome(String busca){
		
		Session sessao = HibernateUtil.getFabricaDeSessoes().openSession();
		
		try {
			 Criteria consulta = sessao.createCriteria(this.classe);
			 consulta.add(Restrictions.like("nome", "%"+busca+"%"));
			 List<Entidade> resultado = consulta.list();
			 return resultado;
			 
		} catch (RuntimeException e) {
			System.out.println(e.toString());
			// TODO: handle exception			 
			throw e;
		} finally {
			sessao.close();
		}
	}
	@SuppressWarnings("unchecked")
	public List<Entidade> buscarCidade(String busca){
		
		Session sessao = HibernateUtil.getFabricaDeSessoes().openSession();
		
		try {
			 Criteria consulta = sessao.createCriteria(this.classe);
			 consulta.add(Restrictions.like("imagem", "%"+busca+"%"));
			 List<Entidade> resultado = consulta.list();
			 return resultado;
			 
		} catch (RuntimeException e) {
			System.out.println(e.toString());
			// TODO: handle exception			 
			throw e;
		} finally {
			sessao.close();
		}
	}	
	@SuppressWarnings("unchecked")
	public List<Entidade> buscarImagens(Long busca){
		
		Session sessao = HibernateUtil.getFabricaDeSessoes().openSession();
		
		try {
			 Criteria consulta = sessao.createCriteria(this.classe);
			 consulta.add(Restrictions.like("imagemPacotesFK", busca));
			 List<Entidade> resultado = consulta.list();
			 return resultado;
			 
		} catch (RuntimeException e) {
			System.out.println(e.toString());
			// TODO: handle exception			 
			throw e;
		} finally {
			sessao.close();
		}
	}
	public void excluir(Entidade entidade) {
		
		Session sessao = HibernateUtil.getFabricaDeSessoes().openSession();
		Transaction transacao = null;
		
		try {
			transacao = sessao.beginTransaction();
			sessao.delete(entidade);
			transacao.commit();
		} catch (RuntimeException e) {
			System.out.println(e.toString());
			// TODO: handle exception
			if (transacao != null)
				transacao.rollback();
			throw e;
		} finally {
			sessao.close();
		}
	}
	
	public void editar(Entidade entidade) {
		
		Session sessao = HibernateUtil.getFabricaDeSessoes().openSession();
		Transaction transacao = null;
		
		try {
			transacao = sessao.beginTransaction();
			sessao.update(entidade);
			transacao.commit();
		} catch (RuntimeException e) {
			System.out.println(e.toString());
			// TODO: handle exception
			if (transacao != null)
				transacao.rollback();
			throw e;
		} finally {
			sessao.close();
		}
	}

}
