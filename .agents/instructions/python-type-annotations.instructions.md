---
applyTo: '**/*.py'
---

# Python Type Annotations

Annotate the shape the data actually has. When the shape is unknown, investigate it — inspect real values, print keys and `type()`, read the producer — instead of widening the type.

## Baseline

Target Python 3.14+. Check `requires-python` in `pyproject.toml` first; follow the repo when it pins an older version.

Annotations evaluate lazily (PEP 649): forward references need no quotes, and `from __future__ import annotations` is obsolete. Quoting stays legal.

## Unions

`Any`, `Union`, `Optional`, `cast`, and bare `dict`/`list`/`tuple` are banned.

```python
class Foo: ...
class Bar: ...

x: Foo | Bar        # correct
x: Foo | None       # correct
x: 'Foo | Bar'      # correct — quoting is legal, unnecessary in 3.14+
x: Union[Foo, Bar]  # wrong
x: Optional[Foo]    # wrong
```

## Dicts

A `dict` with program-fixed keys is a record: declare it as a `@dataclass` or `TypedDict`. Never `dict[str, Any]`.

When a payload varies by a tag field, write a discriminated union and narrow on the tag:

```python
class TextEvent(TypedDict):
    kind: Literal['text']
    body: str

class FileEvent(TypedDict):
    kind: Literal['file']
    path: Path
    size: int

type Event = TextEvent | FileEvent
```

For values that are genuinely open-ended, cover the static envelope with a `@dataclass` or `TypedDict` and type the open leaf `object`, narrowing at the point of use:

```python
class Response(TypedDict):
    status: int
    headers: dict[str, str]
    extensions: dict[str, object]  # keys unknown at author time; narrow before use
```

Where an annotation is not structurally required, omit it and add `# type: ignore` — never `Any`. Keep each ignore on the narrowest line, with a rule code and a short reason when the cause is not obvious.

## Precision

- A closed set of strings is a `Literal` or `Enum`, not `str`.
- Identifiers that must not be confused are distinct `NewType`s.
- Validated and unvalidated values are distinct types, not one type plus a runtime check.
- Accept `Sequence`/`Mapping`/`Iterable` in parameters; return concrete `list`/`dict`.

## Constructs

- `def f[T](x: T) -> T` and `type Alias = ...` (PEP 695), not `TypeVar`/`TypeAlias`.
- `Protocol` for "anything with this shape", not inheritance or an `isinstance` chain.
- `Self` for fluent and factory returns; `@override` on intended overrides.
- `TypeIs` for custom narrowing; `TypeGuard` only when the negative branch must stay unnarrowed.
- `Final` and `ReadOnly` where mutation is not part of the contract.

