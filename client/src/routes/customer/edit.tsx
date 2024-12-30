import {
  Form,
  useLoaderData,
  redirect,
  useNavigate,
  ActionFunctionArgs,
} from 'react-router-dom'

import { Customer, updateCustomer } from '../../data/customers'
import { QueryClient, useSuspenseQuery } from '@tanstack/react-query'
import { customerDetailQuery, loader } from './customer'

export const action =
  (queryClient: QueryClient) =>
  async ({ request, params }: ActionFunctionArgs) => {
    const formData = await request.formData()
    console.log("Inside Customer Action")
    const updates = Object.fromEntries(formData)
    console.log("Id [[["+params.customerID+"]]")
    if (!params.customerID) {
      throw new Error('No customer ID provided')
    }
    await updateCustomer(params.customerID, updates)
    queryClient.invalidateQueries({ queryKey: ['customers'] })
    return redirect(`/customers/${params.customerID}`)
  }

export default function Edit() {
  const { customerID } = useLoaderData() as Awaited<
    ReturnType<ReturnType<typeof loader>>
  >
  const { data: customer } = useSuspenseQuery(customerDetailQuery(customerID))

  return <CustomerForm customer={customer} />
}

export function CustomerForm({ customer }: { customer?: Customer }) {
  const navigate = useNavigate()

  return (
    <Form method="post" id="customer-form">
      <h5 className="flex justify-between font-bold text-white 
                     items-center sticky top-0 z-10 
                     py-4 bg-blue-300">
        New Customer
      </h5>
      <div className="container mx-auto">
        <div className="grid grid-cols-1 gap-6">
          <label className="block">
            <span className="text-gray-700">
              Customer ID
            </span>
            <input type="text"
              className="mt-1 block w-full rounded-md 
                  border-transparent bg-gray-100 
                  focus:border-gray-500 
                  focus:bg-white focus:ring-0"
                  placeholder=""
                  defaultValue={customer?.customerID}                  
            />
          </label>

          <label className="block">
            <span className="text-gray-700">
              Postal Code
            </span>
            <input type="text"
              className="mt-1 block w-full rounded-md 
                  border-transparent bg-gray-100 
                  focus:border-gray-500 
                  focus:bg-white focus:ring-0"
                  placeholder=""
                  defaultValue={customer?.postalCode}                  
            />
          </label>

          <label className="block">
            <span className="text-gray-700">
              Country
            </span>
            <input type="text"
              className="mt-1 block w-full rounded-md 
                  border-transparent bg-gray-100 
                  focus:border-gray-500 
                  focus:bg-white focus:ring-0"
                  placeholder=""
                  defaultValue={customer?.country}                  
            />
          </label>

          <label className="block">
            <span className="text-gray-700">
              Customer Name
            </span>
            <input type="text"
              className="mt-1 block w-full rounded-md 
                  border-transparent bg-gray-100 
                  focus:border-gray-500 
                  focus:bg-white focus:ring-0"
                  placeholder=""
                  defaultValue={customer?.customerName}
            />
          </label>
        
          <label className="block">
            <span className="text-gray-700">
              Supplier ID
            </span>
            <input type="number"
              className="mt-1 block w-full rounded-md 
                  border-transparent bg-gray-100 
                  focus:border-gray-500 
                  focus:bg-white focus:ring-0"
                  placeholder=""
                  defaultValue={customer?.supplierId}
            />
          </label>
          

          <label className="block">
            <span className="text-gray-700">
              Address
            </span>
            <input type="number"
              className="mt-1 block w-full rounded-md 
                  border-transparent bg-gray-100 
                  focus:border-gray-500 
                  focus:bg-white focus:ring-0"
                  placeholder=""
                  defaultValue={customer?.address}
            />
          </label>
          <label className="block">
            <span className="text-gray-700">
              City
            </span>
            <input type="text"
              className="mt-1 block w-full rounded-md 
                  border-transparent bg-gray-100 
                  focus:border-gray-500 
                  focus:bg-white focus:ring-0"
                  placeholder=""
                  defaultValue={customer?.city}
            />
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
