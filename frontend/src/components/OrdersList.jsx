import React, { useState, useEffect } from 'react';
import axios from 'axios';

// Issue: Component does too much, should be broken down
function OrdersList() {
  const [orders, setOrders] = useState([]);
  const [loading, setLoading] = useState(true);
  const [searchTerm, setSearchTerm] = useState('');

  // Issue: No error handling, no cleanup
  useEffect(() => {
    fetchOrders();
  }, []);

  // Issue: Fetches all orders every time, no caching
  const fetchOrders = async () => {
    setLoading(true);
    const response = await axios.get('http://localhost:8080/api/orders');
    setOrders(response.data);
    setLoading(false);
  };

  // Issue: Filtering happens on every render, should use useMemo
  const filteredOrders = orders.filter(order => 
    order.customerName.toLowerCase().includes(searchTerm.toLowerCase())
  );

  // Issue: No optimistic updates, no error feedback
  const handleStatusChange = async (orderId, newStatus) => {
    await axios.put(`http://localhost:8080/api/orders/${orderId}/status?status=${newStatus}`);
    // Issue: Refetches everything instead of updating single order
    fetchOrders();
  };

  // Issue: No confirmation, no error handling
  const handleDelete = async (orderId) => {
    await axios.delete(`http://localhost:8080/api/orders/${orderId}`);
    fetchOrders();
  };

  // Issue: Inline styles, no proper loading state UI
  if (loading) return <div>Loading...</div>;

  return (
    <div style={{ padding: '20px' }}>
      <h1>Orders Management</h1>
      
      {/* Issue: Uncontrolled input, updates on every keystroke without debounce */}
      <input
        type="text"
        placeholder="Search by customer name"
        onChange={(e) => setSearchTerm(e.target.value)}
        style={{ 
          marginBottom: '20px', 
          padding: '8px',
          width: '300px',
          fontSize: '14px'
        }}
      />

      {/* Issue: No virtualization for large lists */}
      <table style={{ 
        width: '100%', 
        borderCollapse: 'collapse',
        backgroundColor: 'white',
        boxShadow: '0 2px 4px rgba(0,0,0,0.1)'
      }}>
        <thead>
          <tr style={{ backgroundColor: '#f8f9fa' }}>
            <th style={{ 
              border: '1px solid #ddd', 
              padding: '12px',
              textAlign: 'left'
            }}>Order ID</th>
            <th style={{ 
              border: '1px solid #ddd', 
              padding: '12px',
              textAlign: 'left'
            }}>Customer</th>
            <th style={{ 
              border: '1px solid #ddd', 
              padding: '12px',
              textAlign: 'left'
            }}>Status</th>
            <th style={{ 
              border: '1px solid #ddd', 
              padding: '12px',
              textAlign: 'right'
            }}>Total</th>
            <th style={{ 
              border: '1px solid #ddd', 
              padding: '12px',
              textAlign: 'center'
            }}>Actions</th>
          </tr>
        </thead>
        <tbody>
          {/* Issue: Key should not use index */}
          {filteredOrders.map((order, index) => (
            <OrderRow
              key={index}
              order={order}
              onStatusChange={handleStatusChange}
              onDelete={handleDelete}
            />
          ))}
        </tbody>
      </table>

      {filteredOrders.length === 0 && (
        <div style={{ 
          padding: '40px', 
          textAlign: 'center',
          color: '#666'
        }}>
          No orders found
        </div>
      )}
    </div>
  );
}

// Issue: Creates new functions on every render (prop drilling)
function OrderRow({ order, onStatusChange, onDelete }) {
  return (
    <tr style={{ borderBottom: '1px solid #eee' }}>
      <td style={{ 
        border: '1px solid #ddd', 
        padding: '12px'
      }}>{order.id}</td>
      <td style={{ 
        border: '1px solid #ddd', 
        padding: '12px'
      }}>{order.customerName}</td>
      <td style={{ 
        border: '1px solid #ddd', 
        padding: '12px'
      }}>
        {/* Issue: Hardcoded status options, no validation */}
        <select
          value={order.status}
          onChange={(e) => onStatusChange(order.id, e.target.value)}
          style={{
            padding: '6px 8px',
            border: '1px solid #ddd',
            borderRadius: '4px',
            fontSize: '14px'
          }}
        >
          <option value="PENDING">Pending</option>
          <option value="PROCESSING">Processing</option>
          <option value="SHIPPED">Shipped</option>
          <option value="DELIVERED">Delivered</option>
          <option value="CANCELLED">Cancelled</option>
        </select>
      </td>
      <td style={{ 
        border: '1px solid #ddd', 
        padding: '12px',
        textAlign: 'right'
      }}>
        {/* Issue: No number formatting, assumes total exists */}
        ${order.total}
      </td>
      <td style={{ 
        border: '1px solid #ddd', 
        padding: '12px',
        textAlign: 'center'
      }}>
        {/* Issue: Inconsistent styling, no accessibility */}
        <button 
          onClick={() => onDelete(order.id)}
          style={{
            padding: '6px 12px',
            backgroundColor: '#dc3545',
            color: 'white',
            border: 'none',
            borderRadius: '4px',
            cursor: 'pointer',
            fontSize: '14px'
          }}
        >
          Delete
        </button>
      </td>
    </tr>
  );
}

export default OrdersList;
