import localforage from 'localforage'
import { matchSorter } from 'match-sorter'
import sortBy from 'sort-by'

const initialData = [
  {
    "orderId": 1,
    "customerId": 4,
    "employeeId": 2,
    "orderDate": "2024-12-10",
    "shipperId": 3
  },
  {
    "orderId": 2,
    "customerId": 8,
    "employeeId": 15,
    "orderDate": "2022-10-08",
    "shipperId": 9
  },
  {
    "orderId": 3,
    "customerId": 90,
    "employeeId": 5,
    "orderDate": "2020-08-06",
    "shipperId": 3
  }
]

export type Order = (typeof initialData)[number]

const seed = async () => {
  const orders = await localforage.getItem<Order[]>('orders')
  if (!orders) {
    set(initialData)
  }
}

seed()

export async function getOrders(query?: string) {
  await fakeNetwork()
  let orders = await localforage.getItem<Order[]>('orders')
  if (!orders) orders = []
  if (query) {
    orders = 
      matchSorter(orders, query, { keys: ['first', 'last'] })
  }
  return orders.sort(sortBy('last', 'createdAt'))
}

export async function createOrder(
  data: 
     Pick<Order, 'first' | 'last' | 'twitter' | 'avatar' | 'notes'>,
) {
  await fakeNetwork()
  let id = Math.random().toString(36).substring(2, 9)
  let order = { ...data, id, createdAt: Date.now(), favorite: false }
  let orders = await getOrders()
  orders.unshift(order)
  await set(orders)
  return order
}

export async function getOrder(id: string) {
  await fakeNetwork()
  let orders = 
     await localforage.getItem<Order[]>('orders')
  if (!orders) return null
  let order = 
    orders.find((order) => order.id === id)
  return order ?? null
}

export async function updateOrder(id: string, updates: Partial<Order>) {
  await fakeNetwork()
  let orders = await localforage.getItem<Order[]>('orders')
  if (!orders) return false
  let order = orders.find((order) => order.orderId === id)
  if (!order) throw new Error(`No order found for ${id}`)
  Object.assign(order, updates)
  await set(orders)
  return order
}

export async function deleteOrder(id: string) {
  let orders = await localforage.getItem<Order[]>('orders')
  if (!orders) return false
  let index = orders.findIndex((order) => order.id === id)
  if (index > -1) {
    orders.splice(index, 1)
    await set(orders)
    return true
  }
  return false
}

function set(orders: Order[]) {
  return localforage.setItem('orders', orders)
}

async function fakeNetwork() {
  return new Promise((res) => {
    setTimeout(res, Math.random() * 800)
  })
}
