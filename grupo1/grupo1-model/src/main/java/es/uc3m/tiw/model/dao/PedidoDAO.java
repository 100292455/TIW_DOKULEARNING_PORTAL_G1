package es.uc3m.tiw.model.dao;

import java.util.Collection;

import es.uc3m.tiw.model.Pedido;

public interface PedidoDAO {
	
	public abstract Pedido guardarPedido(Pedido nuevoPedido) throws Exception;

	public abstract Pedido modificarPedido(Pedido Pedido) throws Exception;

	public abstract void borrarPedido(Pedido Pedido) throws Exception;

	public abstract Pedido recuperarPedidoPorPK(Integer pk);

	public abstract Collection<Pedido> buscarTodosLosPedidos();
	
	public abstract Pedido recuperarPedidoPorCodigoPago(String COD_pago);
	
	public abstract Collection<Pedido> recuperarPedidosSinConciliar();
	
	public abstract Collection<Pedido> recuperarPedidoPorCurso(int idCurso);
	
}
