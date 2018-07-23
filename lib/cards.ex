defmodule Cards do
  @moduledoc """
    Provides methods for creating and handling a deck of cards
  """
  @doc """
    Returns a list of strings representing a deck of playing cards
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamond"]
    for value <- values, suit <-suits do
          "#{value} of #{suit}"
      end
    end


    @doc """
      Shuffles a deck
    """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end
  @doc """
    Determines if a specific hand is in the deck
  """
  def contains?(deck, hand) do
    Enum.member?(deck,hand)
  end

  @doc """
    Divides a deck into a hand the reminder of the deck
    The hand_size argument indicates how many cards should
    be in the hand
    ## Examples

      iex> deck = Cards.create_deck
      iex> {hand,deck} = Cards.deal(deck,1)
      iex> hand
      ["Ace of Spades"]

  """
  def deal(deck, hand_size) do
    Enum.split(deck,hand_size)
  end

  @doc """
    Saves the deck into a file
  """
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename,binary)
  end

  @doc """
    Loads the file with the filename
    Error if there is no such file
  """
  def load(filename) do
    {status, binary}=File.read(filename)

    case status do
      {:ok,binary} -> :erlang.binary_to_term binary
      {:error, _reason} -> "That file does not exist"
    end
  end
  @doc """
    Shuffles a deck, and deals depending on the hand_size, using pipe Operator
  """
  def create_hand(hand_size) do
    # deck = Cards.create_deck
    # deck = Cards.shuffle(deck)
    # hand = Cards.deal(deck, hand_size)
    # Pipe Operator
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end

end
