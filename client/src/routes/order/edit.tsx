import {
  Form,
  useLoaderData,
  redirect,
  useNavigate,
  ActionFunctionArgs,
} from 'react-router-dom'

import { Order, updateOrder } from '../../data/orders'
import { QueryClient, useSuspenseQuery } from '@tanstack/react-query'
import { orderDetailQuery, loader } from './order'

export const action =
  (queryClient: QueryClient) =>
  async ({ request, params }: ActionFunctionArgs) => {
    const formData = await request.formData()
    console.log("Inside Order Action")
    const updates = Object.fromEntries(formData)
    console.log("Id [[["+params.orderId+"]]")
    if (!params.orderId) {
      throw new Error('No order ID provided')
    }
    await updateOrder(params.orderId, updates)
    queryClient.invalidateQueries({ queryKey: ['orders'] })
    return redirect(`/orders/${params.orderId}`)
  }

export default function Edit() {
  const { orderId } = useLoaderData() as Awaited<
    ReturnType<ReturnType<typeof loader>>
  >
  const { data: order } = useSuspenseQuery(orderDetailQuery(orderId))

  return <OrderForm order={order} />
}

export function OrderForm({ order }: { order?: Order }) {
  const navigate = useNavigate()

  return (
    <Form method="post" id="order-form">
            <b>Order Name Order</b><br />
      <b>Order ID</b><br />
      <input placeholder="Enter Order Id"
        aria-label="Order Id" type="text"
        name="orderId" size="60" 
        defaultValue={order.orderId} /><br />
      
      { console.dir(order) }<br />
      
      <b>Customer ID</b><br />
      <input placeholder="Enter Customer Id"
        aria-label="CustomerId" type="text"
        name="CustomerId" size="60" 
        defaultValue={order.customerId} /><br />
      <b>Supplier Id</b><br />
      
      <input placeholder="Enter Employee Id"
        aria-label="employeeId" type="text"
        name="employeeId" 
        defaultValue={order.employeeId} /><br />
        
      <b>Order Date</b><br />
      <input placeholder="Enter Order Date"
        aria-label="orderDate" type="text"
        name="orderDate" size="14" 
        defaultValue={order.orderDate} /><br />
      
      <b>Shipper Id</b><br />
      <input placeholder="Enter Shipper Id"
        aria-label="shipperId" type="text"
        name="shipperId" size="16" 
        defaultValue={order.shipperId} /><br />

      
      <p>
        <button type="submit">Save</button>
        <button type="button" onClick={() => {
            navigate(-1)
          }}
        >
          Cancel
        </button>
      </p>
    </Form>
  )
}
