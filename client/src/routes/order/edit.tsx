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
      
        <div className="grid grid-cols-2 gap-6">
          <button type="submit"
            className="px-2 rounded-r-lg focus:outline-none text-center text-xl text-gray-400➥
            hover:text-gray-900 bg-blue=900">
            Save
          </button>
          {'  '}
          <button type="button" 
            className="px-2 rounded-r-lg focus:outline-none 
                text-center text-xl text-white-200
                hover:text-white-900 bg-blue-300"
              onClick={() => {
              navigate(-1)
            }}
          >
            Cancel
          </button>
        </div>
      </div>
    </Form>
  )
}
