module Fran_cio where
import qualified GHC.Base as Integral
-- ```
-- /*
--  * Crea un generador de números pseudoaleatorios entre 0 y 100.
--  * - No puedes usar ninguna función "random" (o semejante) del lenguaje de programación seleccionado.
--  *
--  * Es más complicado de lo que parece...
--  */
-- ```

-- https://es.wikipedia.org/wiki/Generador_lineal_congruencial
-- a=100 c=1 m=2^32 seed=200

randGenLinCongruencialCaped sec = randGenLinCongruencial sec `mod` maxVal
  where 
    randGenLinCongruencial sec 
      | sec == 0 = (a* seed + c) `mod` m
      | otherwise = (a*randGenLinCongruencial (sec-1) + c) `mod` m
    seed = 6319288236150718131
    m = Integral.maxInt
    a = 100
    c = 1
    maxVal=99


main :: IO ()
main = do
  mapM_ (print . randGenLinCongruencialCaped) [0..9000]

--   Histogram in ascci art
--   .... ................... ......................................................................   
--              :.          ..                                                                         
--              -.          .:             ..               ..  ..                              ..     
--              -.          .-     .:.   ..-.       :.      :: .-.               :.             .-.    
--         ..  .--:.:.     .::     .-.   :.-. .:    -:     .:: .-... . :. .    :.-.   .:     :. .=:    
--         ::  -==-.=:     .=:     --.  .-.-. .-.   :.     :=. .-..--: :. -..  :.:.:. .-    .-. .=:    
--    .::  ::..-==-.=:...:..=:....:--...:=.-. .--. .::.....:=:. -..==:.:-.---..:::.-...-....--...=:..  
--    ..:.:--.--==-.=:...-.:=:...--==-..:=:-...-=-.:-:.-=-.:=:.:-..==:.:=-=--..:--.-...-.::.-=-:.=:..  
--       .-==.--==---=:  -.-=:.:.--==-:.-=--.-.--=----.-=- :=.:==:.==::-===--..--=.-...- :-:-=--:=-.   
--       .--=:--===--=-..-.-=::=:--===-:==--:----===-=.-=-.-=.:==-.==::-===--::=-=.-.-.-.:====--===:   
--       .--==--===--==.--:-=--=:--===-===--===--==--=.-=--==--==---=::-===----=-=.-.-----====--===:   
--       .--==--===--==---===--=.--===--==--===--==--=:-=--==--===--=::-===--===-=.-:-===-====--===:   
--       .--==--===--===--===--=:--===--==--===--==--====--==--===--=::-===--===-=-=--===-====--===:   
--    ....--==--===--===--===--==--===--==--===--==--====--==--===--=---===--===-===--===-====--===:   
--    .-:.-===--===-====--===-===--===-====-===--===-====-====-===--===-===--===-===--===-====--===:.  
--     ...--==--===--===--===--==--===--==--===--==--====--==--===--==--===--===-===--===-====--===:   
--    ...-====-===-====--===-====-===-====-===-====-====-====-===-====-===--===-===--===-====--===:   
--     .:.:--------:-----------------------:--------:----:--------:----------------------:---------:.  
