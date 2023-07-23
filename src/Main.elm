module Main exposing (..)

import Browser
import Markdown
import Html exposing (Html, div, text, audio, source, h3, h4, p, a, button)
import Html.Attributes exposing (style, src, controls, href)
import Html.Events exposing (onClick)
import Time exposing (Posix)
import Task
import Process
import Basics exposing (modBy)
import Json.Decode as Decode exposing (Decoder)
import Http
import Html exposing (Attribute)

-- JSON DECODER

type alias Post =
    { title : String
    , content : String
    , footer : String
    }

postDecoder : Decoder Post
postDecoder =
    Decode.map3 Post
        (Decode.field "title" Decode.string)
        (Decode.field "content" Decode.string)
        (Decode.field "footer" Decode.string)

getPosts : Cmd Msg
getPosts =
    Http.get
        { url = "./resources/blog/posts.json"
        , expect = Http.expectJson GotPosts (Decode.list postDecoder)
        }

-- MODEL

type alias Model =
    { currentImage : Int
    , currentTime : Posix
    , isTextVisible : Bool
    , isPlayingMusic : Bool
    , blogPosts : List Post
    }


init : () -> ( Model, Cmd Msg )
init _ =
    ( { currentImage = 0
      , currentTime = Time.millisToPosix 0
      , isTextVisible = True 
      , isPlayingMusic = True
      , blogPosts = []
      }
    , Cmd.batch [ Process.sleep 1000 |> Task.perform (\_ -> NextImage), getPosts ]
    )


-- UPDATE

type Msg
    = NewTime Posix
    | NextImage
    | ToggleText
    | ToggleMusic
    | GotPosts (Result Http.Error (List Post))


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NewTime newTime ->
            ( { model | currentTime = newTime }, Cmd.none )

        NextImage ->
            ( { model | currentImage = ((model.currentImage + 1) |> modBy 0) }
            , Process.sleep 1000 |> Task.perform (\_ -> NextImage)
            )

        ToggleText ->  
            ( { model | isTextVisible = not model.isTextVisible }, Cmd.none )

        ToggleMusic ->
            ( { model | isPlayingMusic = not model.isPlayingMusic }, Cmd.none )

        GotPosts (Ok posts) ->
            ( { model | blogPosts = posts }, Cmd.none )

        GotPosts (Err _) ->
            ( model, Cmd.none )

-- VIEW

view : Model -> Html Msg
view model =
    let imageUrl = "./resources/background/bg_" ++ String.fromInt model.currentImage ++ ".jpg"
    in
    div
        [ style "background-image"      ("url(" ++ imageUrl ++ ")")
        , style "background-size"       "cover"
        , style "background-attachment" "fixed"
        , style "min-height"            "100vh"
        , style "max-width"             "100vw"
        , style "overflow-x"            "hidden"
        , style "display"               "flex"
        , style "flex-direction"        "column"
        , style "justify-content"       "space-between"
        , style "cursor"                ("url(https://cur.cursors-4u.net/symbols/sym-1/sym86.cur), auto") 
        ]
        [ div 
          [ style "display"             "flex"
          , style "justify-content"     "center"
          , style "max-width"           "100vw"
          , style "overflow"            "hidden"
          ]
          [ div [] [profile model]
          , div [] [blogPosts model]
          ]
        --, audioPlayer
        ]

blockStyle : String -> List (Attribute msg)
blockStyle width = [ style "background-color"  "black"
        , style "color"             "white"
        , style "padding"           "20px"
        , style "width"             width
        , style "margin"            "20px"
        , style "border-radius"     "10px"
        , style "font-family"       "'Courrier new', monospace"
        , style "text-align"        "justify"
        , style "display"           "flex"
        , style "flex-direction"    "column"
        , style "align-items"       "center"
        , style "flex-grow"         "0"
        , style "flex-shrink"       "0" 
        ]

paragraphStyle : List (Attribute msg)
paragraphStyle = 
  [ style "font-size" "10px"
  , style "word-wrap" "break-word"
  ]

postToHtml : Post -> Html msg
postToHtml post = 
  div [] 
      [ h4 [] [text post.title]
      , div (paragraphStyle ++ [style "font-size" "12px" ]) [Markdown.toHtml [] post.content]
      , div (paragraphStyle ++ [ style "text-align" "right" ]) [ text post.footer ]
      ]

blogPosts : Model -> Html Msg
blogPosts model =
    let postElements = List.map postToHtml model.blogPosts
    in div (blockStyle "400px") (h3 [] [ text "[guto@space]$ cat posts.log" ] :: postElements) 


profile : Model -> Html Msg
profile model =
    div (blockStyle "250px")
        (if model.isTextVisible then
          [ h3 [] [ text "[guto@space]$ whoami" ]
          , p paragraphStyle [ text "✷ 1996 † 20XX"]
          , p paragraphStyle [ text "minas gerais, brazil" ]
          , p paragraphStyle [ text "i like cats, sandbox games, functional programming and to do ugly web pages. this one i made with elm!" ]
          , p paragraphStyle [ text "currently working as backend developer, probably with java-like stuff and wishing it was something else funnier."]
          , viewLessButton
          ]
        else 
          [ h3 [] [ text "[guto@space]$ whoami" ]
          , viewMoreButton
          ]
        )
profileButton : List (Html Msg) -> Html Msg
profileButton =  button 
  [ onClick ToggleText
  , style "background" "none"
  , style "border" "none"
  , style "color" "white"
  , style "width" "30px"
  , style "height" "30px"
  , style "display" "flex"
  , style "justify-content" "center"
  , style "align-items" "center"
  ]

viewMoreButton : Html Msg
viewMoreButton = profileButton [ text "+" ]

viewLessButton : Html Msg
viewLessButton = profileButton [ text "-" ]

audioPlayer : Html Msg
audioPlayer =
    audio
        [ controls True 
        , style "width" "100%"
        ]
        [ source
            [ src "/path/to/your/audio/file.mp3" ]
            []
        ]


-- MAIN

main : Program () Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }

