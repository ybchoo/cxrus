import {
  ActionFunctionArgs, Form, Link,
  LoaderFunctionArgs, useFetcher, useLoaderData,
} from 'react-router-dom'
import { Order, getOrder, updateOrder } 
        from '../../data/orders'
import {
  QueryClient,
  queryOptions,
  useSuspenseQuery,
} from '@tanstack/react-query'

export const orderDetailQuery = (orderId: string) =>
  queryOptions({
    queryKey: ['orders', orderId],
    queryFn: async () => {
      const order = await getOrder(orderId)
      if (!order) {
        throw new Response('', {
          status: 404,
          statusText: '############# Not Found',
        })
      }
      return order
    },
  })

export const loader =
  (queryClient: QueryClient) =>
  async ({ params }: LoaderFunctionArgs) => {
    if (!params.orderId) {
      throw new Error('No order ID provided')
    }
    await queryClient.ensureQueryData(
      orderDetailQuery(params.orderId))
    return { orderId: params.orderId }
  }

export const action =
  (queryClient: QueryClient) =>
  async ({ request, params }: ActionFunctionArgs) => {
    let formData = await request.formData()
    console.log("Form Data   [[["+formData+"]]")
    if (!params.orderId) {
      throw new Error('No order ID provided')
    }
    await updateOrder(params.orderId, {
      favorite: formData.get('favorite') === 'true',
    })
    await queryClient.invalidateQueries(
       { queryKey: ['orders'] })
    return null
  }

export default function Order() {
  const { orderId } = useLoaderData() as Awaited<
    ReturnType<ReturnType<typeof loader>>
  >
  const { data: order } = 
     useSuspenseQuery(orderDetailQuery(orderId))

  return (
    <div id="order">
      <b>Order Name Order</b><br />
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

      
      <span>
        <Link to="edit" className="button">
          Edit
        </Link>
        <Form method="post" action="destroy"
          onSubmit={(event) => {
            // eslint-disable-next-line no-restricted-globals
            if (!confirm('Please confirm you want to delete this record.')) {
              event.preventDefault()
            }
          }}
        >
          <button type="submit">Delete</button>
        </Form>
      </span>
    </div>
  )
}

