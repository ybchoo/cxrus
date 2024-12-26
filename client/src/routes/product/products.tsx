import {
  ActionFunctionArgs,
  Form,
  Link,
  LoaderFunctionArgs,
  useFetcher,
  useLoaderData,
} from 'react-router-dom'
import { Product, getProduct, updateProduct } from '../../data/products'
import {
  QueryClient,
  queryOptions,
  useSuspenseQuery,
} from '@tanstack/react-query'

export const productDetailQuery = (id: string) =>
  queryOptions({
    queryKey: ['products', 'detail', id],
    queryFn: async () => {
      const product = await getProduct(id)
      if (!product) {
        throw new Response('', {
          status: 404,
          statusText: 'Not Found',
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
    await queryClient.ensureQueryData(productDetailQuery(params.productId))
    return { productId: params.productId }
  }

export const action =
  (queryClient: QueryClient) =>
  async ({ request, params }: ActionFunctionArgs) => {
    let formData = await request.formData()
    if (!params.productId) {
      throw new Error('No product ID provided')
    }
    await updateProduct(params.productId, {
      favorite: formData.get('favorite') === 'true',
    })
    await queryClient.invalidateQueries({ queryKey: ['products'] })
    return null
  }

export default function Product() {
  const { productId } = useLoaderData() as Awaited<
    ReturnType<ReturnType<typeof loader>>
  >
  const { data: product } = useSuspenseQuery(productDetailQuery(productId))

  return (
    <div id="product">
      <div>
        <img key={product.avatar} src={product.avatar || undefined} />
      </div>

      <div>
        <h1>
          {product.first || product.last ? (
            <>
              {product.first} {product.last}
            </>
          ) : (
            <i>No Name</i>
          )}{' '}
          <Favorite product={product} />
        </h1>

        {product.twitter && (
          <p>
            <a target="_blank" href={`https://twitter.com/${product.twitter}`}>
              {product.twitter}
            </a>
          </p>
        )}

        {product.notes && <p>{product.notes}</p>}

        <div>
          <Link to="edit" className="button">
            Edit
          </Link>
          <Form
            method="post"
            action="destroy"
            onSubmit={(event) => {
              // eslint-disable-next-line no-restricted-globals
              if (!confirm('Please confirm you want to delete this record.')) {
                event.preventDefault()
              }
            }}
          >
            <button type="submit">Delete</button>
          </Form>
        </div>
      </div>
    </div>
  )
}

function Favorite({ product }: { product: Product }) {
  const fetcher = useFetcher({ key: `product:${product.id}` })
  let favorite = product.favorite
  if (fetcher.formData) {
    favorite = fetcher.formData.get('favorite') === 'true'
  }

  return (
    <fetcher.Form method="post">
      <button
        name="favorite"
        value={favorite ? 'false' : 'true'}
        title={favorite ? 'Remove from favorites' : 'Add to favorites'}
      >
        {favorite ? '★' : '☆'}
      </button>
    </fetcher.Form>
  )
}
