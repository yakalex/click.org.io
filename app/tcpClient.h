#ifndef TCPCLIENT_H
#define TCPCLIENT_H

#include <QObject>
#include <QtNetwork>

class TcpClient : public QObject
{
    Q_OBJECT
public:
    explicit TcpClient(QObject *parent = nullptr);
    void sendToServer(QByteArray array);
    void connectToServer();
    void disconnect()
    {m_socket.close();}

private:
    QTcpSocket m_socket;
    QByteArray m_data;
signals:
    void gameFound(int myNumber);
    void gotScores(QList<int> Scores, bool last);

public slots:
    void slotMessageFromServer();
    void serverConnected();
    void connectionDisplayError(QAbstractSocket::SocketError socketError);
    void serverDisconnected();
};

#endif // TCPCLIENT_H