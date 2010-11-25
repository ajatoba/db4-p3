package br.com.db4.buskaza.model.util;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.beanutils.BeanComparator;
import org.apache.commons.beanutils.PropertyUtils;
import org.apache.commons.collections.CollectionUtils;

/**
 * Classe utilitária para Collection.
 * 
 * @author btoledo
 */
public class UtilsCollections {

    /**
     * Constrói instância de 'UtilsCollection'.
     */
    private UtilsCollections() {
        super();
    }

    /**
     * Retorna todos itens que existem em <b>lista1</b> que não existam na <b>lista2</b>.
     * 
     * @param <T> - VO
     * @param lista1 - Lista de associações 1.
     * @param lista2 - Lista de associações 2.
     * @param propriedade Propriedade do VO
     * @return Itens que existem em <b>lista1</b> que não existam na <b>lista2</b>.
     */
    public static <T> Collection<T> removerItensDaLista( final Collection<T> lista1, final Collection<T> lista2, final String propriedade ) {
        if ( lista1 == null || lista2 == null ) {
            return lista1 == null ? new ArrayList<T>() : lista1;
        }

        final Map<Object, T> mapa = listaParaMap( lista1, propriedade );
        final Set<Object> itensParaRemover = listaParaMap( lista2, propriedade ).keySet();

        for ( Iterator itItem = itensParaRemover.iterator(); itItem.hasNext(); ) {
            mapa.remove( itItem.next() );
        }

        return new ArrayList<T>( mapa.values() );
    }

    /**
     * Retorna todos itens que existem na <b>lista1</b> e na <b>lista2</b>.
     * 
     * @param <T> - VO
     * @param lista1 - Lista de associações 1.
     * @param lista2 - Lista de associações 2.
     * @param propriedade Propriedade do VO
     * @return Itens que existem na <b>lista1</b> e na <b>lista2</b>.
     */
    public static <T> Collection<T> removerItensDiferentesDaLista( final Collection<T> lista1, final Collection<T> lista2, final String propriedade ) {
        if ( lista1 == null && lista2 == null ) {
            return new ArrayList<T>();
        } else if ( lista1 == null ) {
            return lista2;
        } else if ( lista2 == null ) {
            return lista1;
        }

        final Map<Object, T> mapa1 = listaParaMap( lista1, propriedade );
        final Map<Object, T> mapa2 = listaParaMap( lista2, propriedade );

        final Collection itensParaRemover = CollectionUtils.disjunction( mapa1.keySet(), mapa2.keySet() );
        for ( Iterator itItem = itensParaRemover.iterator(); itItem.hasNext(); ) {
            mapa1.remove( itItem.next() );
        }

        return new ArrayList<T>( mapa1.values() );
    }

    /**
     * Converte uma Collection em Map.
     * 
     * @param <T> - VO
     * @param lista - Coleção
     * @param propriedade Propriedade do VO
     * @return Map - chave( codigo ) e valor( bean )
     */
    public static <T> Map<Object, T> listaParaMap( final Collection<T> lista, final String propriedade ) {
        final Map<Object, T> mapa = new HashMap<Object, T>();

        try {
            for ( Iterator<T> itBean = lista.iterator(); itBean.hasNext(); ) {
                final T bean = itBean.next();

                mapa.put( PropertyUtils.getProperty( bean, propriedade ), bean );
            }

            return mapa;
        } catch ( Exception e ) {
            throw new IllegalArgumentException( e );
        }
    }
    
    
    /**
     * Converte uma Collection em um Lista
     * 
     * @param <T> - VO
     * @param colecao - Coleção de registros
     * @param propriedade Propriedade do VO
     * @return Map - chave( codigo ) e valor( bean )
     */
    public static <T> List<Long> listarPropriedadeLong( final Collection<T> colecao, final String propriedade ) {
        final List<Long> lista = new ArrayList<Long>();

        try {
            for ( Iterator<T> itBean = colecao.iterator(); itBean.hasNext(); ) {
                final T bean = itBean.next();

                lista.add((Long)PropertyUtils.getProperty( bean, propriedade ));
            }

            return lista;
        } catch ( Exception e ) {
            throw new IllegalArgumentException( e );
        }
    }
    
    
    /**
     * Converte uma Collection em um Lista
     * 
     * @param <T> - VO
     * @param colecao - Coleção de registros
     * @param propriedade Propriedade do VO
     * @return Map - chave( codigo ) e valor( bean )
     */
    public static <T> List<Integer> listarPropriedadeInteger( final Collection<T> colecao, final String propriedade ) {
        final List<Integer> lista = new ArrayList<Integer>();

        try {
            for ( Iterator<T> itBean = colecao.iterator(); itBean.hasNext(); ) {
                final T bean = itBean.next();

                lista.add((Integer)PropertyUtils.getProperty( bean, propriedade ));
            }

            return lista;
        } catch ( Exception e ) {
            throw new IllegalArgumentException( e );
        }
    }
    
    
    /**
     * Converte uma Collection em um Lista
     * 
     * @param <T> - VO
     * @param colecao - Coleção
     * @param propriedade Propriedade do VO
     * @return Map - chave( codigo ) e valor( bean )
     */
    public static <T> List<String> listarPropriedadeString( final Collection<T> colecao, final String propriedade ) {
        final List<String> lista = new ArrayList<String>();

        try {
            for ( Iterator<T> itBean = colecao.iterator(); itBean.hasNext(); ) {
                final T bean = itBean.next();

                lista.add((String)PropertyUtils.getProperty( bean, propriedade ));
            }

            return lista;
        } catch ( Exception e ) {
            throw new IllegalArgumentException( e );
        }
    }

    /**
     * Verifica se a lista está vazia.
     * 
     * @param lista Lista
     * @return Se a lista está vazia.
     */
    public static boolean isEmpty( final Collection lista ) {
        return lista == null || lista.isEmpty();
    }

    /**
     * Ordena a lista de acordo com a propriedade
     * 
     * @param lista Lista de Objetos
     * @param propriedade A propriedade
     */
    @SuppressWarnings( "unchecked" )
    public static void ordenarLista( final List lista, final String propriedade ) {
        if ( isEmpty( lista ) ) {
            return;
        }

        Collections.sort( lista, new BeanComparator( propriedade ) );
    }
}
