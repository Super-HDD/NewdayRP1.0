import { useEffect, useMemo, useState } from "react";
import { useNUIMessage } from "../../util/useNUIMessage";
import s from './AppBlackjack.module.scss';
import { ParticipantData, ParticipantList } from "./components/ParticipantList/ParticipantList";

export const AppBlackjack = () =>
{   
    const [participantList, setParticipantList] = useState<Array<ParticipantData>>([]);

    const [displayUi, setDisplayUi] = useState<boolean>(false);
    const [dealerStateDescription, setDealerStateDescription] = useState<string>('');

    const orderedParticipantList = useMemo(() =>
    {
        return participantList.sort((a, b) =>
        {
            if (a.seat < b.seat)
            {
                return -1;
            }

            return 1;
        });
    }, [ participantList ]);

    useEffect(() =>{

        // setDealerStateDescription('Dealer has a soft 18');

        // setParticipantList([
        //     {   
        //         seat: 1,
        //         cards: ['clubs_3', 'diamonds_8'],
        //         cards_img: ['clubs_3', 'diamonds_8'],
        //         stateDescription: "Aguardando o dealer",
        //         isTurnPlay: false
        //     },
        //     {   
        //         seat: 2,
        //         cards: ['hearts_7', 'spades_3'],
        //         cards_img: ['clubs_3', 'diamonds_8'],
        //         stateDescription: "Aguardando o dealer",
        //         isTurnPlay: true
        //     },
        //     {   
        //         seat: 3,
        //         cards: ['spades_j', 'spades_7', 'hearts_7', 'spades_3', 'hearts_7', 'spades_3'],
        //         cards_img: ['clubs_3', 'diamonds_8'],
        //         stateDescription: "Aguardando o dealer",
        //         isTurnPlay: false
        //     },
        //     {   
        //         seat: 4,
        //         cards: ['diamonds_a', 'spades_j' ],
        //         cards_img: ['clubs_3', 'diamonds_8'],
        //         stateDescription: "Aguardando o dealer",
        //         isTurnPlay: false
        //     },
        // ]);

    },[]);

    useNUIMessage<boolean>('AppBlackjack/DisplayNUI', (data) =>
    {
        setDisplayUi(data);
    });

    useNUIMessage<Array<ParticipantData>>('AppBlackjack/UpdateParticipantList', (data) =>
    {
        setParticipantList(data);
    });

    useNUIMessage<string>('AppBlackjack/SetDealerStateDescription', (data) =>
    {
        setDealerStateDescription(data);
    });

    return (
        <div className={`${s.root} ${ displayUi ? s.active : '' }`} >
            <div className={s.header}>
                <span>{dealerStateDescription}</span>
            </div>

            <div className={s.players}>

                <ParticipantList
                    participantList={orderedParticipantList}
                />

            </div>
        </div>
    )
}