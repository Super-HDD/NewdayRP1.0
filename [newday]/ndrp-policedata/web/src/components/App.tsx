import React, {useState} from 'react';
import './App.css'
import {debugData} from "../utils/debugData";
import {fetchNui} from "../utils/fetchNui";
import { useNuiEvent } from '../hooks/useNuiEvent';

// This will set the NUI to visible if we are
// developing in browser
debugData([
  {
    action: 'setVisible',
    data: true,
  }
])

interface ReturnClientDataCompProps {
  data: any
}

const ReturnClientDataComp: React.FC<ReturnClientDataCompProps> = ({data}) => (
  <>
    <h5>Returned Data:</h5>
    <pre>
      <code>
        {JSON.stringify(data, null)}
      </code>
    </pre>
  </>
)

function RecordsSlot(props:any){
  // let dates=new Date();
  // let dates_str=(dates.getMonth()+1).toString()+"/"+dates.getDay().toString();
  return ( 
    <>
    <div>
        <b>{props.recipient}</b>
    </div>
    <div>
        <b>{props.weapon_name}</b> <span id="view_recipient"></span>
    </div>
    <div>
        <b>{props.weapon_serie}</b> <span id="view_date"></span>
    </div>
    <div>
        <b>{props.date}</b> <span id="view_date"></span>
    </div>
    <div>
        <b>{props.cid}</b> <span id="view_sender"></span>
    </div>
    </>
  );
}

function CreateRecordsList(info:any){
  const RecordsList = info.map((record:any) => <li className='records-slot'>{RecordsSlot(record)}</li>)
  console.log(JSON.stringify(RecordsList))
  return (<>{RecordsList}</>);
}



function WeaponRecordsBox(info:any){
  //  const [records, setRecordsList] = useState(<></>);
  //  setRecordsList(<>{CreateRecordsList(info)}</>);

  return(
    <div className="nui-wrapper">
      <div id='main-container'>
        <div id="weapon-records-header-container">
            <div>
              <div><h2 className="weapon-records-title">警械领取记录</h2></div>
            </div>
             <div className='weapon-records-header'>
                <div>
                    <b>领取人</b> <span id="view_sendername"></span>
                </div>
                <div>
                    <b>武器</b> <span id="view_recipient"></span>
                </div>
                <div>
                    <b>序列号</b> <span id="view_date"></span>
                </div>
                <div>
                    <b>日期</b> <span id="view_date"></span>
                </div>
                <div>
                    <b>邮编</b> <span id="view_sender"></span>
                </div>
             </div>
             <div className='divider-line'/>
        </div>
        <div id='content-container'>
          <ul className='records-container'>
            <>{CreateRecordsList(info)}</>
          </ul>
        </div>
        <div id="footer">
          <div className='divider-line'></div>
        </div>
      </div>
    </div>
  );
}





const App: React.FC = () => {
  const [content, setContent] = useState(<></>);

  useNuiEvent('ShowWeaponRecords',(info)=>{
    console.debug(JSON.stringify(info))
    setContent(<>{WeaponRecordsBox(info)}</>);
    console.debug(content);  
  })

  return (
    <>
      {content}
    </>
  );
   
}

export default App;
