import {
  ActionFunctionArgs, Form, Link,
  LoaderFunctionArgs, useFetcher, useLoaderData,
} from 'react-router-dom'
import { Product, getProduct, updateProduct } 
        from '../../data/products'
import {
  QueryClient,
  queryOptions,
  useSuspenseQuery,
} from '@tanstack/react-query'

export const productDetailQuery = (productId: string) =>
  queryOptions({
    queryKey: ['products', productId],
    queryFn: async () => {
      const product = await getProduct(productId)
      if (!product) {
        throw new Response('', {
          status: 404,
          statusText: '############# Not Found',
        })
      }
      return product
    },
  })

export const loader =
  (queryClient: QueryClient) =>
  async ({ params }: LoaderFunctionArgs) => {
    if (!params.productId) {
      throw new Error('No product ID provided')
    }
    await queryClient.ensureQueryData(
      productDetailQuery(params.productId))
    return { productId: params.productId }
  }

export const action =
  (queryClient: QueryClient) =>
  async ({ request, params }: ActionFunctionArgs) => {
    let formData = await request.formData()
    console.log("Form Data   [[["+formData+"]]")
    if (!params.productId) {
      throw new Error('No product ID provided')
    }
    await updateProduct(params.productId, {
      favorite: formData.get('favorite') === 'true',
    })
    await queryClient.invalidateQueries(
       { queryKey: ['products'] })
    return null
  }

export default function Product() {
  const { productId } = useLoaderData() as Awaited<
    ReturnType<ReturnType<typeof loader>>
  >
  const { data: product } = 
     useSuspenseQuery(productDetailQuery(productId))

  return (
    <div id="product">
      <h5 className="flex justify-between font-bold text-white 
                     items-center sticky top-0 z-10 
                     py-4 bg-blue-400">
        Product Information
      </h5>
      <div className="container mx-auto">
        <div className="grid grid-cols-1 gap-6">
          <label className="block">
            <span className="text-gray-700">
              Product ID
            </span>
            <input type="text"
              className="mt-1 block w-full rounded-md border-transparent bg-gray-100 focus:border-gray-500 focus:bg-white focus:ring-0"
              defaultValue={product?.productId} placeholder="" />
          </label>
          <label className="block">
            <span className="text-gray-700">          
              Product Name
            </span> 
            <input type="text"
              className="mt-1 block w-full rounded-md
              border-transparent bg-gray-100 focus:border-gray-500 focus:bg-white focus:ring-0"
              placeholder="" 
              defaultValue={product?.product_name} />
          </label>
          <label className="block">
            <span className="text-gray-700">          
              Category ID
            </span> 
            <input type="number" min="1" max="2000"
              className="mt-1 block w-full rounded-md
              border-transparent bg-gray-100 
              focus:border-gray-500 focus:bg-white focus:ring-0"
              placeholder="" 
              defaultValue={product?.categoryid} />
          </label>
          <label className="block">
            <span className="text-gray-700">          
              Supplier Id
            </span> 
            <input type="number" min="1" max="50"
              className="mt-1 block w-full rounded-md
              border-transparent bg-gray-100 
              focus:border-gray-500 focus:bg-white focus:ring-0"
              placeholder="" 
              defaultValue={product.categoryid} />
          </label>
          <label className="block">
            <span className="text-gray-700">          
              Price
            </span> 
            <input type="number" step="0.01" min="1" max="2000"
              className="mt-1 block w-full rounded-md
              border-transparent bg-gray-100 
              focus:border-gray-500 focus:bg-white focus:ring-0"
              placeholder="" 
              defaultValue={product?.price} />
          </label>
          <label className="block">
            <span className="text-gray-700">          
              Unit In Stock
            </span> 
            <input type="number" 
              className="mt-1 block w-full rounded-md
              border-transparent bg-gray-100 
              focus:border-gray-500 focus:bg-white focus:ring-0"
              placeholder="" 
              defaultValue={product.units_in_stock} />
          </label>
          <label className="block">
            <span className="text-gray-700">          
              Unit On Order
            </span> 
            <input type="number" min="1" max="15"
              className="mt-1 block w-full rounded-md
              border-transparent bg-gray-100 
              focus:border-gray-500 focus:bg-white focus:ring-0"
              placeholder="" 
              defaultValue={product?.units_on_order} />
          </label>
          <label className="block">
            <span className="text-gray-700">          
              Reorder Level
            </span> 
            <input type="number" min="1" max="15"
              className="mt-1 block w-full rounded-md
              border-transparent bg-gray-100 
              focus:border-gray-500 focus:bg-white focus:ring-0"
              placeholder="" 
              defaultValue={product?.reorder_level} />
          </label>
          <label className="block">
            <span className="text-gray-700">          
              Discontined
            </span> 
            <input type="number" min="1" max="15"
              className="mt-1 block w-full rounded-md
              border-transparent bg-gray-100
              focus:border-gray-500 focus:bg-white focus:ring-0"
              placeholder="" 
              defaultValue={product?.discontinued} 
              />
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
      
    </div>
  )
}

