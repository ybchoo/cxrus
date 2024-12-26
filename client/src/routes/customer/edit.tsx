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
      <div id="customer">
      <b>customer Name customer</b><br />
      <b>customer ID</b><br />
      <input placeholder="Enter customer Id"
        aria-label="customer Id" type="text"
        name="customerId" size="60" 
        defaultValue={customer.customerID} /><br />
      { console.dir(customer) }<br />
      <b>Postal Code</b><br />
      <input placeholder="Enter Postal Code"
        aria-label="postalCode" type="text"
        name="postalCode" size="60" 
        defaultValue={customer.postalCode} /><br />
        
      <b>Country</b><br />
      <input placeholder="Country"
        aria-label="Country" type="text"
        name="country" 
        defaultValue={customer.country} /><br />
        
      <b>Customer Name</b><br />
      <input placeholder="Enter Customer Name"
        aria-label="customerName" type="text"
        name="customerName" size="14" 
        defaultValue={customer.customerName} /><br />
      
      <b>Supplier Id</b><br />
      <input placeholder="Enter Contact Name"
        aria-label="contactName" type="text"
        name="contactName" size="16" 
        defaultValue={customer.contactName} /><br />
      
      <b>Address</b><br />
      <input placeholder="Enter Address"
        aria-label="address" type="text"
        name="address" size="20" 
        defaultValue={customer.address} /><br />
        
      <b>City</b><br />
      <input placeholder="Enter City"
        aria-label="city" type="text"
        name="city" size="18" 
        defaultValue={customer.city} /><br />

      <br />
      
      <p>
        <button type="submit">Save</button>
        <button type="button" onClick={() => {
            navigate(-1)
          }}
        >
          Cancel
        </button>
      </p>
      </div>
    </Form>
  )
}
