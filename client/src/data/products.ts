import localforage from 'localforage'
import { matchSorter } from 'match-sorter'
import sortBy from 'sort-by'

const initialData = [
  {
    "productId": 12,
    "categoryid": 44,
    "discontinued": 45, 
    "product_name": "Product A999",
    "unit": 55,
    "reorder_level": 3,
    "supplierid": 12,
    "price":909.09,
    "units_in_stock":19,
    "units_on_order":5
  },
  {
    "productId": 15,
    "categoryid": 24,
    "discontinued": 5, 
    "product_name": "Product B1",
    "unit": 5,
    "reorder_level": 13,
    "supplierid": 21,
    "price":9.19,
    "units_in_stock":49,
    "units_on_order":53
  },
  {
    "productId": 92,
    "categoryid": 94,
    "discontinued": 49, 
    "product_name": "Product A001",
    "unit": 6,
    "reorder_level": 5,
    "supplierid": 6,
    "price": 60.06,
    "units_in_stock":16,
    "units_on_order":6
  }
]


export type Product = (typeof initialData)[number]

const seed = async () => {
  const products = await localforage.getItem<Product[]>('products')
  if (!products) {
    set(initialData)
  }
}

seed()

export async function getProducts(query?: string) {
  await fakeNetwork()
  let products = await localforage.getItem<Product[]>('products')
  if (!products) products = []
  
  if (query) {
    products = matchSorter(products, query, { keys: ['productId'] })
  }
  return products.sort(sortBy('productId', 'product_name'))
}

export async function createProduct(
  data: Pick<Product, 'productId' | 'categoryid' | 'discontinued' | 'product_name' | 'unit' | 'reorder_level' | 'supplierid' | 'price' | 'units_in_stock' | 'units_on_order' >,
) {
  await fakeNetwork()
  let productId = Math.random().toString(36).substring(2, 9)
  let _categoryid = Math.random().toString(19).substring(2, 9)
  let _discontinued = Math.random().toString(10).substring(2, 4)
  let _product_name = Math.random().toString(10).substring(2, 4)
  let _unit = Math.random().toString(10).substring(2, 4)
  let _reorder_level = Math.random().toString(7).substring(2, 4)
  let _supplierid = Math.random().toString(15).substring(2, 8)
  let _price =  Math.random().toString(10).substring(2, 5)
  let _units_in_stock =  Math.random().toString(10).substring(2, 5)
  let product = { ...data, productId, 
                           categoryid: _categoryid, 
                           discontinued: _discontinued, 
                           product_name: "Product 9",
                           unit: _unit,
                           reorder_level: _reorder_level,
                           supplierid: _supplierid,
                           price: _price, 
                           units_in_stock: _units_in_stock
                           }
  let products = await getProducts()
  products.unshift(product)
  await set(products)
  return product
}

export async function getProduct(id: string) {
    await fakeNetwork()
  let products = await localforage.getItem<Product[]>('products')
  console.dir(products)
  if (!products) 
    return null
  let product = products.find(   
    (product) => {
      return product.productId == id
    }
  )
  console.log("--------------")
  console.log(product)
  return product ?? null
}

export async function updateProduct(id: string, updates: Partial<Product>) {
  await fakeNetwork()
  console.log("Inside Update Product")
  let products = await localforage.getItem<Product[]>('products')
  if (!products)  {
    console.log("No Product")
    return false
  }
  JSON.stringify(products[0])
  
  let product = products.find((product) => {
        console.log("Inside Products")
        JSON.stringify(product)
        product.id == id
      })
  console.log("Product")
  console.dir(product)
  if (!product) 
    throw new Error(`No product found for ${id}`)
  Object.assign(product, updates)
  await set(products)
  return product
}

export async function deleteProduct(id: string) {
  let products = await localforage.getItem<Product[]>('products')
  console.log("Inside Delete Product")
  if (!products) return false
  let index = products.findIndex((product) => product.id === id)
  if (index > -1) {
    products.splice(index, 1)
    await set(products)
    return true
  }
  return false
}

function set(products: Product[]) {
  console.log("Inside Set Product")
  return localforage.setItem('products', products)
}

async function fakeNetwork() {
  return new Promise((res) => {
    setTimeout(res, Math.random() * 800)
  })
}
