import axios from 'axios';

const API_BASE_URL = 'http://localhost:8080/api';

export const orderApi = {
  getAllOrders: () => axios.get(`${API_BASE_URL}/orders`),
  
  getOrderById: (id) => axios.get(`${API_BASE_URL}/orders/${id}`),
  
  searchOrders: (customerName) => 
    axios.get(`${API_BASE_URL}/orders/search`, { 
      params: { customerName } 
    }),
  
  createOrder: (order) => axios.post(`${API_BASE_URL}/orders`, order),
  
  updateOrderStatus: (id, status) => 
    axios.put(`${API_BASE_URL}/orders/${id}/status`, null, { 
      params: { status } 
    }),
  
  deleteOrder: (id) => axios.delete(`${API_BASE_URL}/orders/${id}`)
};

export default orderApi;
