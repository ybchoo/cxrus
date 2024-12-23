import localforage from 'localforage'
import { matchSorter } from 'match-sorter'
import sortBy from 'sort-by'

const initialData = [
  {
    avatar: 'https://placehold.co/100x100',
    createdAt: 1660978713047,
    favorite: false,
    first: 'A First',
    id: 'A',
    last: 'A List',
    notes: 'A List',
    twitter: '@A',
  },
  {
    avatar: 'https://placehold.co/100x100',
    createdAt: 1660979124264,
    favorite: false,
    first: 'B First',
    id: 'B',
    last: 'B Last',
    notes: 'B List',
    twitter: '@B',
  },
]

export type Contact = (typeof initialData)[number]

const seed = async () => {
  const contacts = await localforage.getItem<Contact[]>('contacts')
  if (!contacts) {
    set(initialData)
  }
}

seed()

export async function getContacts(query?: string) {
  await fakeNetwork()
  let contacts = await localforage.getItem<Contact[]>('contacts')
  if (!contacts) contacts = []
  if (query) {
    contacts = matchSorter(contacts, query, { keys: ['first', 'last'] })
  }
  return contacts.sort(sortBy('last', 'createdAt'))
}

export async function createContact(
  data: Pick<Contact, 'first' | 'last' | 'twitter' | 'avatar' | 'notes'>,
) {
  await fakeNetwork()
  let id = Math.random().toString(36).substring(2, 9)
  let contact = { ...data, id, createdAt: Date.now(), favorite: false }
  let contacts = await getContacts()
  contacts.unshift(contact)
  await set(contacts)
  return contact
}

export async function getContact(id: string) {
  await fakeNetwork()
  let contacts = await localforage.getItem<Contact[]>('contacts')
  if (!contacts) return null
  let contact = contacts.find((contact) => contact.id === id)
  return contact ?? null
}

export async function updateContact(id: string, updates: Partial<Contact>) {
  await fakeNetwork()
  let contacts = await localforage.getItem<Contact[]>('contacts')
  if (!contacts) return false
  let contact = contacts.find((contact) => contact.id === id)
  if (!contact) throw new Error(`No contact found for ${id}`)
  Object.assign(contact, updates)
  await set(contacts)
  return contact
}

export async function deleteContact(id: string) {
  let contacts = await localforage.getItem<Contact[]>('contacts')
  if (!contacts) return false
  let index = contacts.findIndex((contact) => contact.id === id)
  if (index > -1) {
    contacts.splice(index, 1)
    await set(contacts)
    return true
  }
  return false
}

function set(contacts: Contact[]) {
  return localforage.setItem('contacts', contacts)
}

async function fakeNetwork() {
  return new Promise((res) => {
    setTimeout(res, Math.random() * 800)
  })
}
