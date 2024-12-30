import localforage from 'localforage'
import { matchSorter } from 'match-sorter'
import sortBy from 'sort-by'

const initialData = [
  {
    "customerID": 1,
    "postalCode": 999999,
    "country": "Country A",
    "customerName": "Brazil Nuts",
    "contactName": "Contact AAAAA",
    "address": "Contact AAAAA Obere Str. 57",
    "city": "Germany"
  },
  {
    "customerID": 3,
    "postalCode": 888888,
    "country": "Country Y",
    "customerName": "Customer Name Y",
    "contactName": "Contact Name Y",
    "address": "Address Y Mataderos 2312",
    "city": "City A."
  },
  {
    "customerID": 4,
    "postalCode": 777777,
    "country": "Country Z",
    "customerName": "Customer Name Z",
    "contactName": "Contact Name Z",
    "address": "Address Z 120 Hanover Sq.",
    "city": "City Z"
  }
]

export type Customer = (typeof initialData)[number]

const seed = async () => {
  const customers = await localforage.getItem<Customer[]>('customers')
  if (!customers) {
    set(initialData)
  }
}

seed()

export async function getCustomers(query?: string) {
  await fakeNetwork()
  console.dir(query)  
  let customers = 
    await localforage.getItem<Customer[]>('customers')
  if (!customers) {
    customers = []
  }
  if (query) {
    customers = 
      matchSorter(customers, query, { keys: ['customerID'] })
  }
  return customers.sort(sortBy('customerID'))
}

export async function createCustomer(
  data: 
     Pick<Customer, 
          'customerID' | 'postalCode' | 
          'country' | 'customerName' | 'contactName' |
          'address', | 'city' >,
) {
  await fakeNetwork()
  
  let customerID = Math.random().toString(36).substring(2, 9)
  
  let customer = { ...data, customerID, 
    postalCode: 'T1', 
    country: 'R2',
    customerName: '',
    address: '',
    city: ''
  }
    
    
  let customers = await getCustomers()
  customers.unshift(customer)
  await set(customers)
  return customer
}

export async function getCustomer(id: string) {
  await fakeNetwork()
  let customers = 
     await localforage.getItem<Customer[]>('customers')
  if (!customers) return null
  let customer = 
    customers.find((customer) => customer.customerID === id)
  return customer ?? null
}

export async function updateCustomer(
    customerID: string, 
    updates: Partial<Customer>) {
  await fakeNetwork()
  let customers = 
    await localforage.getItem<Customer[]>('customers')
  if (!customers) 
    return false
  let customer = customers.find((customer) => 
      customer.customerID === id)
  if (!customer) 
    throw new Error(`No customer found for ${id}`)
  Object.assign(customer, updates)
  await set(customers)
  return customer
}

export async function deleteCustomer(id: string) {
  let customers = await localforage.getItem<Customer[]>('customers')
  if (!customers) 
    return false
  let index = customers.findIndex((customer) => 
    customer.customerID === id)
  if (index > -1) {
    customers.splice(index, 1)
    await set(customers)
    return true
  }
  return false
}

function set(customers: Customer[]) {
  return localforage.setItem('customers', customers)
}

async function fakeNetwork() {
  return new Promise((res) => {
    setTimeout(res, Math.random() * 800)
  })
}
