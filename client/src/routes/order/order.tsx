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
    <h5 className="flex justify-between font-bold text-white 
                     items-center sticky top-0 z-10 
                     py-4 bg-blue-300">
        New Order
      </h5>
      
      <div className="container mx-auto">
        <div className="grid grid-cols-1 gap-6">
          <label className="block">
            <span className="text-gray-700">
              Product ID
            </span>
            <input type="text"
              className="mt-1 block w-full rounded-md border-transparent bg-gray-100 focus:border-gray-500 focus:bg-white focus:ring-0"
               placeholder="" 
               defaultValue={order?.orderId} />
          </label>

          <label className="block">
            <span className="text-gray-700">
              Customer ID
            </span>
            <input type="text"
              className="mt-1 block w-full rounded-md border-transparent bg-gray-100 focus:border-gray-500 focus:bg-white focus:ring-0"
               placeholder="" 
               defaultValue={order?.customerId} />
          </label>
      { console.dir(order) }<br />
          <label className="block">
            <span className="text-gray-700">
              Supplier Id
            </span>
            <input type="number"
              className="mt-1 block w-full rounded-md border-transparent bg-gray-100 focus:border-gray-500 focus:bg-white focus:ring-0"
               placeholder="" 
               defaultValue={order?.supplierId} />
          </label>
          
          <label className="block">
            <span className="text-gray-700">
              Employee Id
            </span>
            <input type="number"
              className="mt-1 block w-full rounded-md border-transparent bg-gray-100 focus:border-gray-500 focus:bg-white focus:ring-0"
               placeholder="" 
               defaultValue={order?.employeeId} />
          </label>
        
          <label className="block">
            <span className="text-gray-700">
              Order Date
            </span>
            <input type="date"
              className="mt-1 block w-full rounded-md border-transparent bg-gray-100 focus:border-gray-500 focus:bg-white focus:ring-0"
               placeholder="" 
               defaultValue={order?.orderDate} />
          </label>
        
          <label className="block">
            <span className="text-gray-700">
              Shipper Id
            </span>
            <input type="date"
              className="mt-1 block w-full rounded-md border-transparent bg-gray-100 focus:border-gray-500 focus:bg-white focus:ring-0"
               placeholder="" 
               defaultValue={order?.shipperId} />
          </label>      
        </div>
      <div>
      <br />
      <br />
      <div className="grid grid-cols-2 gap-6">
        <Link to="edit" 
              className="px-2 rounded-r-lg focus:outline-none text-center text-xl text-gray-400➥
              hover:text-gray-900 bg-white">
          Edit
        </Link>
        <Form method="post" action="destroy" onSubmit={(event) => {
            // eslint-disable-next-line no-restricted-globals
            if (!confirm('Please confirm you want to delete '+
                         'this record.')) {
              event.preventDefault()
            }
          }}
        >
          <button type="submit"
              className="px-2 rounded-r-lg focus:outline-none text-center text-xl text-gray-400➥
              hover:text-gray-900 bg-white">
              Delete
          </button>
        </Form>
      </div>
    </div>
  )
}

