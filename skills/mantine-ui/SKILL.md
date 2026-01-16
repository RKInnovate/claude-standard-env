---
name: mantine-ui
description: Comprehensive guide to Mantine UI component library for building responsive React applications with 120+ components and hooks
---

# Mantine UI Component Library

A fully featured React components library with 120+ customizable components and 50+ hooks. Use this skill when building user interfaces with Mantine.

## Installation

```bash
pnpm add @mantine/core @mantine/hooks
pnpm add -D postcss postcss-preset-mantine postcss-simple-vars
```

## Basic Setup

```tsx
import '@mantine/core/styles.css';
import { MantineProvider } from '@mantine/core';

function App() {
  return (
    <MantineProvider>
      {/* Your app content */}
    </MantineProvider>
  );
}
```

---

## Component Categories

### Layout & Structure

#### AppShell
**Import**: `import { AppShell } from '@mantine/core';`

**Use Cases**:
- **Admin Dashboards**: Create complex layouts with sidebar, header, footer, and main content area
- **SaaS Applications**: Build responsive layouts that adapt from desktop (sidebar visible) to mobile (collapsible drawer)
- **Documentation Sites**: Structure with fixed header, scrollable sidebar navigation, and content area
- **E-commerce Backends**: Multi-panel layouts for inventory management, orders, and analytics

**Key Features**:
- Responsive navbar that collapses on mobile
- Fixed or scrollable header/footer
- Aside panels (left/right sidebars)
- Automatic padding and spacing management
- Mobile-first with `breakpoints` support

**Example Structure**:
```tsx
import { AppShell, Burger } from '@mantine/core';
import { useDisclosure } from '@mantine/hooks';

function Layout() {
  const [opened, { toggle }] = useDisclosure();

  return (
    <AppShell
      header={{ height: 60 }}
      navbar={{ width: 300, breakpoint: 'sm', collapsed: { mobile: !opened } }}
      padding="md"
    >
      <AppShell.Header>
        <Burger opened={opened} onClick={toggle} hiddenFrom="sm" />
      </AppShell.Header>
      <AppShell.Navbar>Navbar content</AppShell.Navbar>
      <AppShell.Main>Main content</AppShell.Main>
    </AppShell>
  );
}
```

---

#### Container
**Import**: `import { Container } from '@mantine/core';`

**Use Cases**:
- Responsive max-width wrappers (xs: 540px, sm: 720px, md: 960px, lg: 1140px, xl: 1320px)
- Centering page content with consistent padding

---

#### Grid & SimpleGrid
**Import**: `import { Grid, SimpleGrid } from '@mantine/core';`

**Use Cases**:
- **Grid**: Complex responsive layouts with custom column spans per breakpoint
- **SimpleGrid**: Equal-width columns that automatically wrap (product cards, image galleries)

**Grid Example**:
```tsx
<Grid>
  <Grid.Col span={{ base: 12, md: 8 }}>Main content</Grid.Col>
  <Grid.Col span={{ base: 12, md: 4 }}>Sidebar</Grid.Col>
</Grid>
```

**SimpleGrid Example**:
```tsx
<SimpleGrid cols={{ base: 1, sm: 2, lg: 4 }} spacing="lg">
  {items.map(item => <Card key={item.id}>{item.content}</Card>)}
</SimpleGrid>
```

---

#### Stack & Group
**Import**: `import { Stack, Group } from '@mantine/core';`

**Use Cases**:
- **Stack**: Vertical layouts with consistent spacing (form fields, list items)
- **Group**: Horizontal layouts (button groups, toolbars, tag lists)

---

#### Flex
**Import**: `import { Flex } from '@mantine/core';`

**Use Cases**:
- Custom flexbox layouts with Mantine's responsive props
- Replace Stack/Group when you need more control

---

### Navigation

#### Tabs
**Import**: `import { Tabs } from '@mantine/core';`

**Use Cases**:
- Multi-section forms (registration wizard: account → profile → preferences)
- Content organization (product details: overview, specs, reviews)
- Settings panels (account, security, notifications)

**Example**:
```tsx
<Tabs defaultValue="gallery">
  <Tabs.List>
    <Tabs.Tab value="gallery">Gallery</Tabs.Tab>
    <Tabs.Tab value="messages">Messages</Tabs.Tab>
    <Tabs.Tab value="settings">Settings</Tabs.Tab>
  </Tabs.List>
  <Tabs.Panel value="gallery">Gallery content</Tabs.Panel>
  <Tabs.Panel value="messages">Messages content</Tabs.Panel>
  <Tabs.Panel value="settings">Settings content</Tabs.Panel>
</Tabs>
```

---

#### NavLink
**Import**: `import { NavLink } from '@mantine/core';`

**Use Cases**:
- Sidebar navigation with active states
- Nested navigation menus
- Collapsible navigation groups

---

#### Stepper
**Import**: `import { Stepper } from '@mantine/core';`

**Use Cases**:
- Multi-step forms (checkout process, onboarding)
- Progress tracking workflows
- Sequential data entry

---

#### Pagination
**Import**: `import { Pagination } from '@mantine/core';`

**Use Cases**:
- Table pagination
- Search results navigation
- Gallery/carousel page controls

---

#### Breadcrumbs
**Import**: `import { Breadcrumbs } from '@mantine/core';`

**Use Cases**:
- Show hierarchical navigation path
- E-commerce category navigation

---

### Data Display

#### Table
**Import**: `import { Table } from '@mantine/core';`

**Use Cases**:
- Display tabular data with striped rows, hover effects, borders
- Responsive tables (scroll horizontally on mobile)
- Sortable column headers with user data

**Example**:
```tsx
<Table striped highlightOnHover>
  <Table.Thead>
    <Table.Tr>
      <Table.Th>Name</Table.Th>
      <Table.Th>Email</Table.Th>
      <Table.Th>Role</Table.Th>
    </Table.Tr>
  </Table.Thead>
  <Table.Tbody>
    {rows.map(row => (
      <Table.Tr key={row.id}>
        <Table.Td>{row.name}</Table.Td>
        <Table.Td>{row.email}</Table.Td>
        <Table.Td>{row.role}</Table.Td>
      </Table.Tr>
    ))}
  </Table.Tbody>
</Table>
```

---

#### Card
**Import**: `import { Card } from '@mantine/core';`

**Use Cases**:
- Product cards in e-commerce
- Blog post previews
- User profile cards
- Dashboard metric cards

**Example with sections**:
```tsx
<Card shadow="sm" padding="lg" radius="md" withBorder>
  <Card.Section>
    <Image src="product.jpg" height={160} />
  </Card.Section>
  <Text weight={500} size="lg" mt="md">Product Name</Text>
  <Text size="sm" color="dimmed">Description</Text>
  <Button fullWidth mt="md">Add to cart</Button>
</Card>
```

---

#### Accordion
**Import**: `import { Accordion } from '@mantine/core';`

**Use Cases**:
- FAQ sections
- Collapsible content panels
- Settings groups

---

#### Timeline
**Import**: `import { Timeline } from '@mantine/core';`

**Use Cases**:
- Order tracking (placed → shipped → delivered)
- Activity feeds
- Project milestones

---

#### List
**Import**: `import { List } from '@mantine/core';`

**Use Cases**:
- Bullet/numbered lists with custom icons
- Feature lists
- Task lists

---

#### Badge
**Import**: `import { Badge } from '@mantine/core';`

**Use Cases**:
- Status indicators (active, pending, completed)
- Tags and labels
- Notification counts

---

#### Avatar & AvatarGroup
**Import**: `import { Avatar, AvatarGroup } from '@mantine/core';`

**Use Cases**:
- User profiles
- Comment sections
- Team member lists
- **AvatarGroup**: Show multiple users (collaborators on a document)

---

#### Image
**Import**: `import { Image } from '@mantine/core';`

**Use Cases**:
- Responsive images with fallback
- Image galleries with consistent sizing

---

#### BackgroundImage
**Import**: `import { BackgroundImage } from '@mantine/core';`

**Use Cases**:
- Hero sections with background images
- Card backgrounds

---

#### Indicator
**Import**: `import { Indicator } from '@mantine/core';`

**Use Cases**:
- Notification badges on icons/avatars
- Online status indicators
- Unread message counts

---

#### ThemeIcon
**Import**: `import { ThemeIcon } from '@mantine/core';`

**Use Cases**:
- Consistent icon styling with theme colors
- Feature list icons
- Status indicators

---

#### Kbd
**Import**: `import { Kbd } from '@mantine/core';`

**Use Cases**:
- Display keyboard shortcuts (Ctrl + C, Cmd + K)
- Documentation for keyboard navigation

---

#### Code & CodeHighlight
**Import**: `import { Code } from '@mantine/core';`

**Use Cases**:
- Inline code snippets
- Code blocks (requires `@mantine/code-highlight` package)

---

### Forms & Inputs

#### Authentication Forms
**Common Pattern for Login/Register/Reset Password**

**Use Cases**:
- User login with email/password
- Registration with validation
- Password reset flows
- Social authentication (Google, GitHub, etc.)

**Example Login Form**:
```tsx
import { TextInput, PasswordInput, Button, Paper, Title, Anchor } from '@mantine/core';
import { useForm } from '@mantine/form';

function LoginForm() {
  const form = useForm({
    initialValues: { email: '', password: '' },
    validate: {
      email: (value) => (/^\S+@\S+$/.test(value) ? null : 'Invalid email'),
      password: (value) => (value.length < 6 ? 'Password must be at least 6 characters' : null),
    },
  });

  return (
    <Paper withBorder shadow="md" p={30} radius="md">
      <Title order={2} ta="center" mb="md">Welcome back</Title>
      <form onSubmit={form.onSubmit((values) => console.log(values))}>
        <TextInput
          label="Email"
          placeholder="you@example.com"
          {...form.getInputProps('email')}
        />
        <PasswordInput
          label="Password"
          placeholder="Your password"
          mt="md"
          {...form.getInputProps('password')}
        />
        <Button fullWidth mt="xl" type="submit">Sign in</Button>
        <Anchor size="sm" ta="center" mt="md">Forgot password?</Anchor>
      </form>
    </Paper>
  );
}
```

---

#### TextInput & Textarea
**Import**: `import { TextInput, Textarea } from '@mantine/core';`

**Use Cases**:
- Form fields with labels, descriptions, errors
- Search inputs with icons
- Multi-line text input

---

#### PasswordInput
**Import**: `import { PasswordInput } from '@mantine/core';`

**Use Cases**:
- Password fields with show/hide toggle
- Password strength meter (with custom validation)

---

#### NumberInput
**Import**: `import { NumberInput } from '@mantine/core';`

**Use Cases**:
- Quantity selectors
- Price inputs
- Age/year inputs with min/max validation

---

#### Select & MultiSelect
**Import**: `import { Select, MultiSelect } from '@mantine/core';`

**Use Cases**:
- **Select**: Single choice dropdowns (country, category, status)
- **MultiSelect**: Multiple selections with tags (skills, interests, tags)
- Searchable dropdowns
- Create new options dynamically

**Example**:
```tsx
<Select
  label="Country"
  placeholder="Pick one"
  data={['USA', 'Canada', 'UK', 'Germany']}
  searchable
/>

<MultiSelect
  label="Skills"
  placeholder="Pick all that apply"
  data={['React', 'TypeScript', 'Node.js', 'Python']}
  searchable
/>
```

---

#### Checkbox & CheckboxGroup
**Import**: `import { Checkbox } from '@mantine/core';`

**Use Cases**:
- Terms & conditions acceptance
- Feature toggles
- Multi-option selection (with CheckboxGroup)

---

#### Radio & RadioGroup
**Import**: `import { Radio } from '@mantine/core';`

**Use Cases**:
- Single selection from multiple options
- Settings with exclusive choices
- Survey questions

---

#### Switch
**Import**: `import { Switch } from '@mantine/core';`

**Use Cases**:
- Enable/disable features
- Dark mode toggles
- Notification preferences

---

#### Slider & RangeSlider
**Import**: `import { Slider, RangeSlider } from '@mantine/core';`

**Use Cases**:
- Price range filters
- Volume/brightness controls
- Age range selection

---

#### Rating
**Import**: `import { Rating } from '@mantine/core';`

**Use Cases**:
- Product reviews
- Feedback forms
- Difficulty ratings

---

#### ColorInput & ColorPicker
**Import**: `import { ColorInput, ColorPicker } from '@mantine/core';`

**Use Cases**:
- Theme customization
- Design tools
- Highlight color selection

---

#### FileInput
**Import**: `import { FileInput } from '@mantine/core';`

**Use Cases**:
- File uploads (documents, images)
- Avatar upload
- CSV import

---

#### DatePickerInput & DateInput
**Import**: `import { DatePickerInput, DateInput } from '@mantine/dates';`

**Use Cases**:
- Birthday selection
- Event scheduling
- Date range filters

**Installation**: `pnpm add @mantine/dates dayjs`

---

#### JsonInput
**Import**: `import { JsonInput } from '@mantine/core';`

**Use Cases**:
- API payload configuration
- JSON data entry with validation
- Developer tools

---

#### PinInput
**Import**: `import { PinInput } from '@mantine/core';`

**Use Cases**:
- OTP verification
- PIN code entry
- Security codes

---

#### SegmentedControl
**Import**: `import { SegmentedControl } from '@mantine/core';`

**Use Cases**:
- View toggles (list/grid)
- Time period selection (day/week/month)
- Filter options

---

#### Chip & ChipGroup
**Import**: `import { Chip } from '@mantine/core';`

**Use Cases**:
- Tag selection
- Filter chips
- Option toggles

---

### Buttons & Actions

#### Button
**Import**: `import { Button } from '@mantine/core';`

**Variants**: `filled`, `light`, `outline`, `subtle`, `default`, `gradient`

**Use Cases**:
- Primary/secondary actions
- Form submissions
- Navigation triggers
- With loading states, icons, compact sizes

**Example**:
```tsx
<Button variant="filled">Primary</Button>
<Button variant="light" leftSection={<IconPlus />}>Add Item</Button>
<Button loading>Saving...</Button>
<Button component="a" href="/profile">Go to Profile</Button>
```

---

#### ActionIcon
**Import**: `import { ActionIcon } from '@mantine/core';`

**Use Cases**:
- Icon-only buttons (close, edit, delete)
- Toolbar actions
- Color scheme toggle

---

#### Menu
**Import**: `import { Menu } from '@mantine/core';`

**Use Cases**:
- Dropdown menus (user profile, actions, settings)
- Context menus
- More options buttons

**Example**:
```tsx
<Menu>
  <Menu.Target>
    <Button>Options</Button>
  </Menu.Target>
  <Menu.Dropdown>
    <Menu.Item leftSection={<IconEdit />}>Edit</Menu.Item>
    <Menu.Item leftSection={<IconTrash />} color="red">Delete</Menu.Item>
  </Menu.Dropdown>
</Menu>
```

---

#### CloseButton
**Import**: `import { CloseButton } from '@mantine/core';`

**Use Cases**:
- Close modals/drawers
- Dismiss notifications
- Remove tags/chips

---

#### CopyButton
**Import**: `import { CopyButton } from '@mantine/core';`

**Use Cases**:
- Copy API keys, URLs, code snippets
- Share links

---

#### FileButton
**Import**: `import { FileButton } from '@mantine/core';`

**Use Cases**:
- Trigger file uploads with custom button styles

---

### Overlays

#### Modal
**Import**: `import { Modal } from '@mantine/core';`

**Use Cases**:
- Confirmation dialogs (delete confirmation)
- Form modals (create new item)
- Image/video lightboxes
- Detailed views without navigation

**Example**:
```tsx
import { useDisclosure } from '@mantine/hooks';

function ModalExample() {
  const [opened, { open, close }] = useDisclosure(false);

  return (
    <>
      <Button onClick={open}>Open Modal</Button>
      <Modal opened={opened} onClose={close} title="Confirm Action">
        Are you sure you want to delete this item?
        <Button onClick={close} mt="md">Cancel</Button>
        <Button color="red" onClick={handleDelete} mt="md">Delete</Button>
      </Modal>
    </>
  );
}
```

---

#### Drawer
**Import**: `import { Drawer } from '@mantine/core';`

**Use Cases**:
- Side panels for filters
- Mobile navigation menus
- Shopping cart slideovers
- Form sidebars

**Positions**: `top`, `left`, `right`, `bottom`

---

#### Popover
**Import**: `import { Popover } from '@mantine/core';`

**Use Cases**:
- Tooltips with interactive content
- Color pickers
- Date pickers
- Mini forms

---

#### HoverCard
**Import**: `import { HoverCard } from '@mantine/core';`

**Use Cases**:
- User profile previews on hover
- Product quick views
- Rich tooltips with images/links

---

#### Tooltip
**Import**: `import { Tooltip } from '@mantine/core';`

**Use Cases**:
- Simple text hints on hover
- Icon button labels
- Disabled button explanations

---

#### Overlay
**Import**: `import { Overlay } from '@mantine/core';`

**Use Cases**:
- Dim background content
- Create focus overlays
- Loading states

---

#### LoadingOverlay
**Import**: `import { LoadingOverlay } from '@mantine/core';`

**Use Cases**:
- Show loading state over content
- Form submission feedback
- Async operations

---

### Feedback

#### Alert
**Import**: `import { Alert } from '@mantine/core';`

**Use Cases**:
- Info messages
- Warning banners
- Error notifications
- Success confirmations

**Example**:
```tsx
<Alert icon={<IconInfoCircle />} title="Notice!" color="blue">
  Your session will expire in 5 minutes.
</Alert>
```

---

#### Notification
**Import**: `import { notifications } from '@mantine/notifications';`

**Use Cases**:
- Toast notifications
- Action feedback (saved, deleted, error occurred)
- System messages

**Installation**: `pnpm add @mantine/notifications`

**Example**:
```tsx
import { notifications } from '@mantine/notifications';

notifications.show({
  title: 'Success',
  message: 'Your changes have been saved',
  color: 'green',
});
```

---

#### Progress
**Import**: `import { Progress } from '@mantine/core';`

**Use Cases**:
- File upload progress
- Task completion indicators
- Loading progress

---

#### RingProgress
**Import**: `import { RingProgress } from '@mantine/core';`

**Use Cases**:
- Circular progress indicators
- Statistics visualization (goal completion)
- Multi-segment progress

---

#### Skeleton
**Import**: `import { Skeleton } from '@mantine/core';`

**Use Cases**:
- Loading placeholders
- Content loading states
- Lazy-loaded component placeholders

---

#### Loader
**Import**: `import { Loader } from '@mantine/core';`

**Use Cases**:
- Button loading states
- Centered page loaders
- Inline loading indicators

---

### Typography

#### Title
**Import**: `import { Title } from '@mantine/core';`

**Use Cases**:
- Page headings (order 1-6)
- Section titles
- Responsive text sizes

---

#### Text
**Import**: `import { Text } from '@mantine/core';`

**Use Cases**:
- Body text with consistent styling
- Colored text, dimmed text
- Truncated text with ellipsis
- Gradient text

**Example**:
```tsx
<Text size="xl" fw={700}>Bold large text</Text>
<Text c="dimmed">Secondary text</Text>
<Text lineClamp={2}>Long text that gets truncated after 2 lines...</Text>
```

---

#### Blockquote
**Import**: `import { Blockquote } from '@mantine/core';`

**Use Cases**:
- Quotes with citation
- Highlighted text blocks

---

#### Mark & Highlight
**Import**: `import { Mark, Highlight } from '@mantine/core';`

**Use Cases**:
- Highlight search terms
- Emphasize text portions

---

### Miscellaneous

#### Paper
**Import**: `import { Paper } from '@mantine/core';`

**Use Cases**:
- Card containers
- Form wrappers
- Content sections with shadow/border

---

#### Center
**Import**: `import { Center } from '@mantine/core';`

**Use Cases**:
- Center content horizontally and vertically
- Center loaders, empty states

---

#### Space
**Import**: `import { Space } from '@mantine/core';`

**Use Cases**:
- Add spacing between elements (alternative to margins)

---

#### Divider
**Import**: `import { Divider } from '@mantine/core';`

**Use Cases**:
- Separate sections
- Visual breaks with optional labels

---

#### Anchor
**Import**: `import { Anchor } from '@mantine/core';`

**Use Cases**:
- Styled links with hover states
- Navigation links

---

#### ScrollArea
**Import**: `import { ScrollArea } from '@mantine/core';`

**Use Cases**:
- Scrollable content areas with custom scrollbars
- Fixed-height containers
- Modal/drawer content

---

#### Affix
**Import**: `import { Affix } from '@mantine/core';`

**Use Cases**:
- Floating action buttons
- Back to top buttons
- Fixed position elements

---

#### Transition & Collapse
**Import**: `import { Transition, Collapse } from '@mantine/core';`

**Use Cases**:
- Animated show/hide
- Expandable content sections
- Smooth UI transitions

---

#### Portal
**Import**: `import { Portal } from '@mantine/core';`

**Use Cases**:
- Render components outside DOM hierarchy
- Modals, tooltips, dropdowns

---

#### FocusTrap
**Import**: `import { FocusTrap } from '@mantine/core';`

**Use Cases**:
- Trap focus within modals
- Accessible keyboard navigation

---

#### Spoiler
**Import**: `import { Spoiler } from '@mantine/core';`

**Use Cases**:
- Expandable text with "Show more" button
- Long descriptions
- Terms & conditions

---

#### Dialog
**Import**: `import { Dialog } from '@mantine/core';`

**Use Cases**:
- Floating notifications
- Non-blocking messages
- Cookie consent banners

---

## Common Hooks

### useDisclosure
**Import**: `import { useDisclosure } from '@mantine/hooks';`

**Use Cases**:
- Toggle modals, drawers, menus
- Boolean state with open/close/toggle handlers

```tsx
const [opened, { open, close, toggle }] = useDisclosure(false);
```

---

### useForm
**Import**: `import { useForm } from '@mantine/form';`

**Use Cases**:
- Form state management
- Validation
- Error handling

```tsx
const form = useForm({
  initialValues: { name: '', email: '' },
  validate: {
    email: (value) => (/^\S+@\S+$/.test(value) ? null : 'Invalid email'),
  },
});
```

---

### useClipboard
**Import**: `import { useClipboard } from '@mantine/hooks';`

**Use Cases**:
- Copy to clipboard functionality
- Copy buttons with feedback

---

### useMediaQuery
**Import**: `import { useMediaQuery } from '@mantine/hooks';`

**Use Cases**:
- Responsive behavior in JavaScript
- Conditional rendering based on screen size

```tsx
const isMobile = useMediaQuery('(max-width: 768px)');
```

---

### useHover
**Import**: `import { useHover } from '@mantine/hooks';`

**Use Cases**:
- Detect hover state
- Show/hide elements on hover

---

### useLocalStorage
**Import**: `import { useLocalStorage } from '@mantine/hooks';`

**Use Cases**:
- Persist state in localStorage
- Theme preferences, user settings

---

## Responsive Design Patterns

### Breakpoints
Mantine uses these default breakpoints:
- `xs`: 36em (576px)
- `sm`: 48em (768px)
- `md`: 62em (992px)
- `lg`: 75em (1200px)
- `xl`: 88em (1408px)

### Responsive Props
Most components accept responsive props:

```tsx
<Box
  w={{ base: '100%', sm: '50%', lg: '33%' }}
  p={{ base: 'sm', md: 'lg' }}
>
  Content
</Box>
```

### Visibility
Show/hide components at breakpoints:

```tsx
<Button visibleFrom="sm">Desktop Only</Button>
<Burger hiddenFrom="sm">Mobile Menu</Burger>
```

---

## Common UI Patterns

### Dashboard Layout
```tsx
<AppShell
  header={{ height: 60 }}
  navbar={{ width: 300, breakpoint: 'sm' }}
  padding="md"
>
  <AppShell.Header>{/* Header content */}</AppShell.Header>
  <AppShell.Navbar>{/* Sidebar navigation */}</AppShell.Navbar>
  <AppShell.Main>
    <SimpleGrid cols={{ base: 1, sm: 2, lg: 3 }}>
      <Card>Metric 1</Card>
      <Card>Metric 2</Card>
      <Card>Metric 3</Card>
    </SimpleGrid>
  </AppShell.Main>
</AppShell>
```

### Form with Validation
```tsx
import { useForm } from '@mantine/form';
import { TextInput, Button, Stack } from '@mantine/core';

function ContactForm() {
  const form = useForm({
    initialValues: { name: '', email: '', message: '' },
    validate: {
      name: (value) => (value.length < 2 ? 'Name too short' : null),
      email: (value) => (/^\S+@\S+$/.test(value) ? null : 'Invalid email'),
      message: (value) => (value.length < 10 ? 'Message too short' : null),
    },
  });

  return (
    <form onSubmit={form.onSubmit(handleSubmit)}>
      <Stack>
        <TextInput label="Name" {...form.getInputProps('name')} />
        <TextInput label="Email" {...form.getInputProps('email')} />
        <Textarea label="Message" {...form.getInputProps('message')} />
        <Button type="submit">Submit</Button>
      </Stack>
    </form>
  );
}
```

### Search with Filters
```tsx
<Stack>
  <TextInput
    placeholder="Search..."
    leftSection={<IconSearch />}
  />
  <Group>
    <Select label="Category" data={categories} />
    <RangeSlider label="Price Range" min={0} max={1000} />
    <Button>Apply Filters</Button>
  </Group>
  <SimpleGrid cols={{ base: 1, sm: 2, md: 3 }}>
    {filteredResults.map(item => <Card key={item.id}>{item.name}</Card>)}
  </SimpleGrid>
</Stack>
```

---

## Official Documentation & References

### Core Documentation
1. **Getting Started**: https://mantine.dev/getting-started/
   - Installation instructions, setup guide, and initial configuration
   - Quick start examples and basic usage patterns

2. **Theming & MantineProvider**: https://mantine.dev/theming/mantine-provider/
   - Theme customization (colors, fonts, spacing, shadows)
   - MantineProvider configuration
   - CSS variables and design tokens
   - Dark/light mode setup

3. **Core Components Package**: https://mantine.dev/core/package/
   - Complete reference for all 120+ components
   - Props documentation with TypeScript types
   - Component examples and demos

4. **Hooks Package**: https://mantine.dev/hooks/package/
   - 50+ React hooks for common use cases
   - State management, DOM interactions, utilities
   - Custom hook examples

5. **Form Management**: https://mantine.dev/form/package/
   - Form state management
   - Validation rules and custom validators
   - Error handling and touched fields
   - Form submission and reset

6. **Extensions (Mantine X)**: https://mantine.dev/x/extensions/
   - Additional packages and integrations
   - Notifications (@mantine/notifications)
   - Code highlight (@mantine/code-highlight)
   - Dates (@mantine/dates)
   - Spotlight search (@mantine/spotlight)
   - Charts (@mantine/charts)
   - Data tables (@mantine/datatable)
   - Dropzone (@mantine/dropzone)
   - And more specialized packages

7. **GitHub Repository**: https://github.com/mantinedev/mantine
   - Source code and examples
   - Issue tracking and feature requests
   - Community contributions

### Package Installation Reference

```bash
# Core packages (required)
pnpm add @mantine/core @mantine/hooks

# PostCSS setup (required)
pnpm add -D postcss postcss-preset-mantine postcss-simple-vars

# Optional packages (install as needed)
pnpm add @mantine/form              # Form management
pnpm add @mantine/dates dayjs       # Date/time pickers
pnpm add @mantine/notifications     # Toast notifications
pnpm add @mantine/code-highlight    # Code syntax highlighting
pnpm add @mantine/spotlight         # Command palette
pnpm add @mantine/charts recharts   # Data visualization
pnpm add @mantine/dropzone          # File upload
pnpm add @mantine/carousel embla-carousel-react  # Carousels
pnpm add @mantine/tiptap @tiptap/react  # Rich text editor
```

---

## When to Use This Skill

Use the `mantine-ui` skill when:
- Building React user interfaces with Mantine components
- Creating responsive layouts and dashboards
- Implementing forms with validation
- Designing authentication flows
- Building data tables and cards
- Creating modals, drawers, and overlays
- Working with notifications and feedback messages
- Implementing navigation patterns (tabs, menus, steppers)
