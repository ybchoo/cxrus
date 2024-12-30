import {
  ActionFunctionArgs, Form, Link,
  LoaderFunctionArgs, useFetcher, useLoaderData,
} from 'react-router-dom'
import { Customer, getCustomer, updateCustomer } 
        from '../../data/Customers'
import {
  QueryClient,
  queryOptions,
  useSuspenseQuery,
} from '@tanstack/react-query'

export const customerDetailQuery = (customerID: string) =>
  queryOptions({
    queryKey: ['customers', customerID],
    queryFn: async () => {
      const customer = await getcustomer(customerID)
      if (!customer) {
        throw new Response('', {
          status: 404,
          statusText: '############# Not Found',
        })
      }
      return customer
    },
  })

export const loader =
  (queryClient: QueryClient) =>
  async ({ params }: LoaderFunctionArgs) => {
    if (!params.customerID) {
      throw new Error('No customer ID provided')
    }
    await queryClient.ensureQueryData(
      customerDetailQuery(params.customerId))
    return { customerID: params.customerID }
  }

export const action =
  (queryClient: QueryClient) =>
  async ({ request, params }: ActionFunctionArgs) => {
    let formData = await request.formData()
    console.log("Form Data   [[["+formData+"]]")
    
    if (!params.customerId) {
      throw new Error('No customer ID provided')
    }
    
    await updatecustomer(params.customerId, {
      favorite: formData.get('favorite') === 'true',
    })
    
    
    await queryClient.invalidateQueries(
       { queryKey: ['customers'] })
    return null
  }

export default function customer() {
  const { customerID } = useLoaderData() as Awaited<
    ReturnType<ReturnType<typeof loader>>
  >
  const { data: customer } = 
     useSuspenseQuery(customerDetailQuery(customerID))

  return (
    <div id="product">
      <h5 className="flex justify-between font-bold text-white 
                     items-center sticky top-0 z-10 
                     py-4 bg-blue-400">
        Customer Information
      </h5>
      <div className="container mx-auto">
        <div className="grid grid-cols-1 gap-6">
          <label className="block">
            <span className="text-gray-700">
             Customer ID
            </span>
            <input type="text"
              className="mt-1 block w-full rounded-md border-transparent bg-gray-100 focus:border-gray-500 focus:bg-white focus:ring-0"
              defaultValue={product?.customerID} 
              placeholder="" />
          </label>
          { console.dir(customer) }<br />
          <label className="block">
            <span className="text-gray-700">          
              Customer Name
            </span> 
            <input  type="text" placeholder=""
              className="mt-1 block w-full rounded-md
              border-transparent bg-gray-100 
              focus:border-gray-500 
              focus:bg-white focus:ring-0" 
              defaultValue={customer?.customerName} />
          </label>
          <label className="block">
            <span className="text-gray-700">          
              Postal Code
            </span> 
            <input  type="text" placeholder=""
              className="mt-1 block w-full rounded-md
              border-transparent bg-gray-100 
              focus:border-gray-500 
              focus:bg-white focus:ring-0" 
              defaultValue={customer?.postalCode} />
          </label>
          <label className="block">
            <span className="text-gray-700">          
              Country
            </span> 
            <input className="mt-1 block w-full rounded-md 
                   border-transparent bg-gray-100 
                   focus:border-gray-500 
                   focus:bg-white focus:ring-0"
                   defaultValue={product?.country} 
          </label>
          <label className="block">
            <span className="text-gray-700">          
              Contact Name
            </span> 
            <input className="mt-1 block w-full rounded-md 
                   border-transparent bg-gray-100 
                   focus:border-gray-500 
                   focus:bg-white focus:ring-0"
              defaultValue={customer.?contactName} />
          </label>

          <label className="block">
            <span className="text-gray-700">          
              Address
            </span> 
            <input className="mt-1 block w-full rounded-md 
                   border-transparent bg-gray-100 
                   focus:border-gray-500 
                   focus:bg-white focus:ring-0"
              defaultValue={customer.?address} />
          </label>

          <label className="block">
            <span className="text-gray-700">          
              City
            </span> 
            <input className="mt-1 block w-full rounded-md 
                   border-transparent bg-gray-100 
                   focus:border-gray-500 
                   focus:bg-white focus:ring-0"
              defaultValue={customer.?city} />
          </label>          
        </div>
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

